# activate_display.rb
#
# this file should be executed automatically via a udev rule when an external
# display is hotplugged. we will use bytes 8-11 for identifying a display. see
# this page for information about EDID header format:
# https://en.wikipedia.org/wiki/Extended_Display_Identification_Data#EDID_1.4_data_format
#
# example edid: 00 ff ff ff ff ff ff 00 10 ac 32 a1 4c 31 47 30

FRAMEWORK = "09e55f09"
EDID_REGEX = /^edid/i
DOTS_DIR = "/home/elliot/dotfiles"
SCRIPTS_DIR = "#{DOTS_DIR}/scripts"
SCREENLAYOUT_DIR = "#{DOTS_DIR}/.screenlayout"
DPI_SCRIPT_PATH = "#{SCRIPTS_DIR}/dpi"


class Display
  attr_reader :edid, :screenlayout_file_path, :dpi

  def initialize(edid, screenlayout_file_path, dpi)
    @edid = edid
    @screenlayout_file_path = screenlayout_file_path
    @dpi = dpi
  end

  def apply!
    cmd = "sh #{screenlayout_file_path} && #{DPI_SCRIPT_PATH} #{dpi}"
    log("applying screenlayout commands: #{cmd}")
    system(cmd)
  end
end

DISPLAYS = [
  Display.new(FRAMEWORK, "#{SCREENLAYOUT_DIR}/framework-int.sh", 140),
  Display.new("06b30427", "#{SCREENLAYOUT_DIR}/asus-27in.sh", 96), # asus VG27AQL1A
  Display.new("10ac32a1", "#{SCREENLAYOUT_DIR}/unlv-dell.sh", 96) # dell widescreen in TBE B
]

EXTERNAL_AUTO = Display.new(nil, "#{SCREENLAYOUT_DIR}/external-auto.sh", 96)

def log(s)
  puts "#{Time.now} - activate_display.rb : #{s}" 
end

###########################################################################################################
# 
# begin!

xrandr_prop = `xrandr --prop`             # 1. get current connections from xrandr
                .split("\n")              # 2. process linewise
                .map(&:strip)             # 3. remove all excess whitespace
edids = xrandr_prop.each_index            # 4. iterate via indexes
             .filter { |i| EDID_REGEX.match(xrandr_prop[i]) } # 5. take indexes only for lines starting with "EDID:"
             .map { |i| i + 1 }           # 6. EDID header is the next line, add 1 to the selected indexes
             .map { |i| xrandr_prop[i] }  # 7. map indexes to actual EDIDs

if edids.count == 1 || edids.count == 2
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
                .first || FRAMEWORK # default to internal framework display

log("selecting edid manufacturer & product id: #{mfg_prod}")

display = DISPLAYS.filter { |d| d.edid == mfg_prod }.first

unless display
  log("WARN: no known screenlayout file for manufacturer/" \
      "product id: #{mfg_prod}... jesus take the wheel!")
  display = EXTERNAL_AUTO
end

exit(display.apply!)
