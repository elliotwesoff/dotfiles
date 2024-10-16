#!/usr/bin/fish
#
# ipod-sync.fish

# some helpful vim commands:
#
# turn something like this
#     /path/to/folder
# into
#     "/path/to/folder" \
#
#  => :s/\(\S.*\)/"\1" \
#
# remove base path from folders:
#
#  => :%s/\/shared\/Music\/mp3\///g

if ! mountpoint -q /mnt/ipod
  echo mount your ipod first dummy!
  return 1
end

if ! fish_is_root_user
  echo this needs to be ran as root until we can mount the ipod properly -_-\'
  return 1
end

set mp3_dir "/shared/Music/mp3"

set mp3_folders \
  "DIIV" \
  "Dimmu Borgir" \
  "Dorena" \
  "Earl Sweatshirt" \
  "Earth/The Bees Made Honey In The Lions Skull" \
  "Earth Wind & Fire" \
  "Electric Wizard" \
  "El Trio de Omar Rodriguez Lopez" \
  "Emmure" \
  "Explosions In The Sky" \
  "Feist" \
  "Foals/ANTIDOTES" \
  "Forsaken Autumn" \
  "Foxing" \
  "Frederic Chopin" \
  "Funkadelic" \
  "Ghoul" \
  "Girl Talk" \
  "Goat" \
  "Godspeed You! Black Emperor" \
  "Gorguts" \
  "Grand Funk Railroad" \
  "Green Day" \
  "Grouper" \
  "Guns N' Roses" \
  "Haste the Day" \
  "Hella" \
  "If These Trees Could Talk" \
  "I Killed the Prom Queen" \
  "Incubus" \
  "Indoor Voices" \
  "Interpol" \
  "Intronaut" \
  "Irepress" \
  "Iron Butterfly" \
  "Iron Maiden" \
  "Iron & Wine" \
  "ISIS" \
  "Islands" \
  "iwrestledabearonce" \
  "Jackson Browne" \
  "Jesu" \
  "Job For A Cowboy" \
  "Joyce Manor" \
  "Joy Division" \
  "Killers" \
  "Killswitch Engage" \
  "King Crimson" \
  "Knights Of The Abyss" \
  "Last Days of Humanity" \
  "Led Zeppelin" \
  "Linkin Park" \
  "Lit" \
  "Local Natives" \
  "Lush" \
  "Lydia" \
  "Mac Demarco" \
  "Margot and the nuclear so and so's" \
  "Marriages" \
  "Mastodon" \
  "Mates Of State" \
  "Melt Banana" \
  "Menomena" \
  "Metallica" \
  "Metronomy/The English Riviera" \
  "MGMT" \
  "Milo Greene" \
  "Minus the Bear" \
  "Modest Mouse" \
  "Mogwai" \
  "Mono" \
  "Morning Benders" \
  "Mortal Treason" \
  "Moving Mountains" \
  "Mum" \
  "múm" \
  "Mumford & Sons" \
  "Muse" \
  "Mustard Plug" \
  "My Bloody Valentine" \
  "Never Shout Never" \
  "Night School" \
  "Nightwish" \
  "Nine Inch Nails" \
  "Nirvana/Bleach" \
  "Nirvana/In Utero" \
  "Nirvana/Nevermind" \
  "No Doubt" \
  "Norma Jean" \
  "Nothing" \
  "Nujabes" \
  "Oasis" \
  "Oathbreaker" \
  "Oceans" \
  "Om" \
  "Omega Massif" \
  "Operation Ivy/Energy" \
  "Ornette Coleman" \
  "Palms" \
  "Panopticon" \
  "Pantera" \
  "Paramnesia" \
  "Parkway Drive" \
  "Passion Pit" \
  "Pavement" \
  "Pianos Become The Teeth" \
  "Pig Destroyer" \
  "Pinegrove" \
  "Placebo" \
  "Porcupine Tree" \
  "Portugal. The Man" \
  "Primus" \
  "Queen" \
  "Radiohead" \
  "Ray Barbee" \
  "Red Hot Chili Peppers" \
  "Red Sparowes" \
  "Return to Forever" \
  "Ride" \
  "Rooftops" \
  "Rosetta" \
  "Seapony" \
  "Shadows Fall" \
  "Sharks Keep Moving" \
  "Sigur Rós" \
  "Silversun Pickups" \
  "Slayer" \
  "Sleep" \
  "Slowdive" \
  "Smashing Pumpkins" \
  "Sonic Youth" \
  "Soundgarden" \
  "Stars" \
  "Stereolab" \
  "Streetlight Manifesto" \
  "STRFKR" \
  "Sumac" \
  "Sunny Day Real Estate" \
  "Swimfaster Godwhispers" \
  "Taking Back Sunday" \
  "Tame Impala" \
  "Team Sleep" \
  "Tennis" \
  "Tera Melos"
  "The Allman Brothers Band" \
  "The Aquabats" \
  "The Avalanches" \
  "The Black Dahlia Murder" \
  "The Chariot" \
  "The Cure" \
  "The Devil Wears Prada" \
  "The End of the Ocean" \
  "The Fall of Troy" \
  "The Format" \
  "The Head and the Heart" \
  "The Killers" \
  "The Locust" \
  "The Mars Volta" \
  "The Most Serene Republic" \
  "The Number 12 Looks Like You" \
  "The Postal Service" \
  "The Radio Dept" \
  "The Smiths" \
  "The Temper Trap" \
  "The Toasters" \
  "The Unicorns" \
  "The Velvet Underground" \
  "The Void" \
  "The Walkmen" \
  "The Wallflowers" \
  "The War on Drugs" \
  "The Who" \
  "The Wipers" \
  "The World is a Beautiful Place & I am No Longer Afraid to Die" \
  "This Town Needs Guns" \
  "This Will Destroy You" \
  "Three Trapped Tigers" \
  "Thursday" \
  "Tigers Jaw" \
  "Tokyo Shoegazer" \
  "Tombs" \
  "Tool" \
  "Touché Amoré" \
  "Trevor Howarth" \
  "Turnover" \
  "Two Door Cinema Club" \
  "Tycho" \
  "Underoath" \
  "Unexpect" \
  "Unknown Mortal Orchestra" \
  "Vampire Weekend" \
  "Vetiver" \
  "VNV Nation" \
  "Walk the Moon" \
  "Warpaint" \
  "Washed Out" \
  "Weezer" \
  "whirr" \
  "Wilco" \
  "Wild Nothing" \
  "Wolves In The Throne Room" \
  "Yeah Yeah Yeahs" \
  "Yellowcard" \
  "Yes" \
  "You Slut!"



for dir in $mp3_folders
  rsync -rv "$mp3_dir/$dir" /mnt/ipod/music/mp3
end
