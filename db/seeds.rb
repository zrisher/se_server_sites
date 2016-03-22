# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gos_description =
'We focus on providing an excellent PVP experience, solid performance, reliability, and game-enhancing features. Our players are modders too, constantly working to improve the experience here. Everything we make is open-source and shared with the Space Engineers community. We are looking for contributors!!!

Currently we feature:
Garden Conquest, a custom map, and carefully selected mods

We are working towards:
Native dynamic conceal, Improved weapon selection and balance including better turrets and guided missiles, more types of heavy armor, automated Shipyards, veterancy/kill tracking feature, improved autopilot, and radar.

#### Special Thanks
* Chickenbranches - All around awesomeness
* Frysguy - Admin help, map design
* Hostaspace.com - Our host and a great company
* Martyr of Kharak - Wrote the core of GardenConquest
* Toby - GardenConquest features
* You - For playing here!'

gos_rules =
'1. No hacks or cheats
2. No exploits or glitches
3. No VAC Bans, no matter age or game
4. Must have at least 3 hours of Space Engineers play time
5. Be respectful to admins

Report rule breaches to an admin via Steam. Eventually we will add in-game reporting functionality.'

gos_settings =
"Restarts: 7am & 7pm EST

#### Garden Conquest: Classes & Block Limits
Type \"/gc help\" at any time for info. If you're new to the server, we highly suggest you familiarize yourself with it.

#### Custom Map
Asteroids are concentrated at the CPs (marked via GPS on your HUD) as well as in 3 large fields between them. There are also asteroids randomly spread throughout the map, but past 125 km out from the center they become very sparse. The map is currently infinitely large, but may be moved back to 500 km with a few days warning.

#### SE Settings
* 10x Inventory Size
* 10x Refinery Speed
* 10x Assembler Speed
* 3x Assembler Efficiency
* 3x Weld Speed
* 3x Grinder Speed
* 1x Hack Speed (.33 hack multiplier times 3x grind  speed, this is double Vanilla's .5x)
* 4x spawn ship time
* Ingame Scrips - ON
* Thruster Damage ON
* Tool Shake OFF
* Realistic sound ON
* Cargo Ships OFF
* Encounters OFF
* Auto Delete Respawn Ship ON - once you choose another, previous will be removed
* Permanent Death OFF
* Environment Hostility SAFE"


gos = Server.create!(
  name: 'Gardens of Sajuuk',
  domain: '158.69.127.175',
  port: 27039,
  steam_group_url: 'https://steamcommunity.com/groups/gardens_of_sajuuk',
  description: gos_description,
  rules: gos_rules,
  settings: gos_settings,
  mumble_domain: 'urxp.typefrag.com',
  mumble_port: 8220,
  mumble_channel: 'Space Engineers'
)

gos.mods << [
  Mod.create!(steam_id: 295393216),
  Mod.create!(steam_id: 297371314),
  Mod.create!(steam_id: 298550266),
  Mod.create!(steam_id: 298913292)
]

gos.save!


# mods, admin