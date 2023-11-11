# activate_display.rb
#
# this file should be executed automatically via a udev rule when an external
# display is hotplugged. we will use bytes 8-11 for identifying a display. see
# this page for information about EDID header format:
# https://en.wikipedia.org/wiki/Extended_Display_Identification_Data#EDID_1.4_data_format

FRAMEWORK = "09e55f09"
EDID_REGEX = /^edid/i
DOTS_DIR = "/home/elliot/dotfiles"
SCRIPTS_DIR = "#{DOTS_DIR}/scripts"
SCREENLAYOUT_DIR = "#{DOTS_DIR}/.screenlayout"
EXTERNAL_AUTO = "#{SCREENLAYOUT_DIR}/external-auto.sh"

# this is our bread and butter. map EDID manufacturer & product codes
# to known screenlayout files. this effectively runs a screenlayout
# file if one exists for the hotplugged monitor. i'm lazy!
# 00 ff ff ff ff ff ff 00 10 ac 32 a1 4c 31 47 30
DISPLAYS = {
  FRAMEWORK => "#{SCREENLAYOUT_DIR}/framework-int.sh", # framework internal display - eDP-1
  "06b30427" => "#{SCREENLAYOUT_DIR}/asus-27in.sh", # asus VG27AQL1A
  "10ac32a1" => "#{SCREENLAYOUT_DIR}/unlv-dell.sh",
}

def log(s)
  puts "#{Time.now} - activate_display.rb : #{s}" 
end

dpi = 96

xrandr_prop = `xrandr --prop`
                .split("\n")              # 1. process linewise
                .map(&:strip)             # 2. remove all excess whitespace
edids = xrandr_prop.each_index            # 3. iterate via indexes
             .select { |i| EDID_REGEX.match(xrandr_prop[i]) } # 4. take indexes only for lines with "EDID:"
             .map { |i| i + 1 }           # 5. EDID header is the next line, add 1 to the selected indexes
             .map { |i| xrandr_prop[i] }  # 6. grab the EDIDs

if [1, 2].include?(edids.count)
  log("#{edids.count} displays found, EDID headers: #{edids}")
else
  log("#{edids.count} displays found. not sure what to do... ABORT!")
  exit(1)
end

# throw away the first 8 bytes of the EDID header, the next two bytes are
# manufacturer ID, and the next two are mfg's product ID. we'll use those two
# together to identify a display.
mfg_prod = edids.map { |edid| edid[16..23] }
                .reject { |edid| edid == FRAMEWORK }
                .first || FRAMEWORK
log("selecting edid manufacturer & product id: #{mfg_prod}")

# build shell command
commands = ['sh', '', '&&', 'sh', "#{SCRIPTS_DIR}/dpi", dpi.to_s]
if DISPLAYS[mfg_prod]
  commands[1] = DISPLAYS[mfg_prod]
else
  log("WARN: no known screenlayout file for manufacturer and " \
      "product id: #{mfg_prod}... jesus take the wheel!")
  commands[1] = EXTERNAL_AUTO
end

command = commands.join(' ')
log("applying screenlayout with dpi: #{command}")
exit(system(command))
