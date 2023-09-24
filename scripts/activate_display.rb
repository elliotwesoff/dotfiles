# activate_display.rb
#
# this file should be executed automatically via a udev rule when an external
# display is hotplugged. we will use bytes 8-11 for identifying a display. see
# this page for information about EDID header format:
# https://en.wikipedia.org/wiki/Extended_Display_Identification_Data#EDID_1.4_data_format

FRAMEWORK = "09e55f09"
EDID_REGEX = /^edid/i
SCREENLAYOUT_DIR = "/home/elliot/dotfiles/.screenlayout"
XRANDR_EXTERNAL_AUTO_SL = "#{SCREENLAYOUT_DIR}/external-auto.sh"

# this is our bread and butter. map EDID manufacturer & product codes
# to known screenlayout files. this effectively runs a screenlayout
# file if one exists for the hotplugged monitor. i'm lazy!
DISPLAYS = {
  FRAMEWORK => "#{SCREENLAYOUT_DIR}/framework-int.sh", # framework internal display - eDP-1
  "06b30427" => "#{SCREENLAYOUT_DIR}/asus-27in.sh" # asus VG27AQL1A
  "xxxxxxxx" => "#{SCREENLAYOUT_DIR}/unlv-dell.sh" # TODO
}

def log(s)
  puts "#{Time.now} - #{s}" 
end

raw = `xrandr --prop`
clean = raw.split("\n").map(&:strip)
edid_preindices = clean.each_index.select { |i| EDID_REGEX.match(clean[i]) }
edids = edid_preindices.map { |i| i + 1 }.map { |i| clean[i] }

log("#{edids.count} displays found, EDID headers: #{edids}")

mfg_prod = ""
if edids.count == 2
  edids.each do |edid|
    # throw away the first 8 bytes of the EDID header,
    # the next two bytes are manufacturer ID, and the
    # next two are mfg's product ID. we'll use those
    # two together to identify a display.
    mfg_prod = edid[16..23]
    if mfg_prod == FRAMEWORK
      mfg_prod = ""
    else
      log("selecting edid manufacturer & product id: #{mfg_prod}")
      break
    end
  end
elsif edids.count == 1
  mfg_prod = FRAMEWORK
else
  log("activate_display.rb #{edids.count} monitors found. not sure what to do... ABORT!")
  exit(1)
end

screenlayout = DISPLAYS[mfg_prod]
if screenlayout
  command = "sh #{screenlayout}"
else
  log("something went wrong. no known screenlayout file. letting xrandr decide our fate...")
  command = "sh #{XRANDR_EXTERNAL_AUTO_SL}"
end

log("applying screenlayout: #{command}")
exit(system(command))
