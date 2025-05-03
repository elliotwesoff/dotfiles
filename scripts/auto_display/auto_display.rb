#!/usr/bin/env ruby
# activate_display.rb
#
# this file should be executed automatically via a udev rule when an external
# display is hotplugged. we will use bytes 8-11 for identifying a display. see
# this page for information about EDID header format:
# https://en.wikipedia.org/wiki/Extended_Display_Identification_Data#EDID_1.4_data_format
#
# example edid: 00 ff ff ff ff ff ff 00 10 ac 32 a1 4c 31 47 30

FRAMEWORK = "09e5ca0b"
SCREENLAYOUT_DIR = "/usr/local/src/screenlayouts"

class Display
  attr_reader :edid, :xrandr_script, :name

  def initialize(edid, xrandr_script, name)
    @edid = edid
    @xrandr_script = xrandr_script
    @name = name
  end

  def apply!
    cmd = "sh #{xrandr_script}"
    log("applying with shell cmd: `#{cmd}`")
    system(cmd)
  end
end

DISPLAYS = [
  Display.new(FRAMEWORK, "#{SCREENLAYOUT_DIR}/framework-int.sh", "framework internal"),
  Display.new("06b30427", "#{SCREENLAYOUT_DIR}/asus-27in.sh", "asus VG27AQL1A"), 
  Display.new("10ac32a1", "#{SCREENLAYOUT_DIR}/unlv-dell.sh", "dell widescreen in TBE B"),
  Display.new("09d1ed78", "#{SCREENLAYOUT_DIR}/seo-benq.sh", "seo's crappy BenQ monitor"),
  Display.new("63181596", "#{SCREENLAYOUT_DIR}/tcl-55in.sh", "big ass tv dude"),
  Display.new("06b32227", "#{SCREENLAYOUT_DIR}/seo-asus-vg27.sh", "seo's fancy new monitor")
]

EXTERNAL_AUTO = Display.new(nil, "#{SCREENLAYOUT_DIR}/external-auto.sh", "external (xrandr --auto)")

def log(s)
  puts "#{Time.now} - activate_display.rb : #{s}" 
end

###########################################################################################################
# 
# begin!
#

puts "***** auto_display.rb - v0.0.4 *****"

xrandr_prop = `xrandr --prop`             # 1. get current connections from xrandr
                .split("\n")              # 2. process linewise
                .map(&:strip)             # 3. remove all excess whitespace
edids = xrandr_prop.each_index            # 4. iterate via indexes
             .filter { |i| /^edid/i.match(xrandr_prop[i]) } # 5. take indexes only for lines starting with "EDID:"
             .map { |i| i + 1 }           # 6. EDID header is the next line, add 1 to the selected indexes
             .map { |i| xrandr_prop[i] }  # 7. map indexes to actual EDIDs

log("#{edids.count} displays found, EDID headers: #{edids}")

if edids.count > 2
  log("#{edids.count} displays found! not sure what to do... ABORT!")
  exit(1)
end

# throw away the first 8 bytes of the EDID header, the next two bytes are
# manufacturer ID, and the next two are the manufacturer's product ID. we'll
# use those two together to identify a display.
mp_id = edids.map { |edid| edid[16..23] }
                .reject { |edid| edid == FRAMEWORK }
                .first || FRAMEWORK # default to internal framework display

display = DISPLAYS.filter { |display| display.edid == mp_id }.first

if display
  log("selecting known edid manufacturer & product id: #{display.edid} (#{display.name})")
else
  log("WARN: no known screenlayout file for manufacturer & " \
      "product id: #{mp_id}... jesus take the wheel!")
  display = EXTERNAL_AUTO
end

exit(display.apply!)
