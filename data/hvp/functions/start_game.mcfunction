execute if entity @a[team=Player] run function hvp:actually_start_game_dont_manually_call
execute unless entity @a[team=Player] run title @a title "No player!"
execute unless entity @a[team=Player] run title @a subtitle "Sign up as the player with /trigger be_player!"