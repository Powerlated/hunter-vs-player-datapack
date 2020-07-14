execute as @a[scores={be_player=1..}] run function hvp:be_player
execute as @a[scores={be_player=1..}] run scoreboard players reset @a be_player

spawnpoint @a 0 76 0

# Set world spawn at Player so compass always points there
execute as @a[team=Player,limit=1] at @s run setworldspawn ~ ~ ~

execute store result score #pos_x player_pos run data get entity @e[team=Player,limit=1] Pos[0]
execute store result score #pos_y player_pos run data get entity @e[team=Player,limit=1] Pos[1]
execute store result score #pos_z player_pos run data get entity @e[team=Player,limit=1] Pos[2]

execute as @a at @s run function hvp:show_pos_for_self

# Give compass back on death
# @e[type=player] targets only alive players, @a targets all players, regardless if the are alive or dead.
give @e[type=player,scores={deaths=1..},team=Hunters] compass
scoreboard players reset @e[type=player] deaths