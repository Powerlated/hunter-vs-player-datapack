execute as @a[scores={be_player=1..}] run function hvp:be_player
execute as @a[scores={be_player=1..}] run scoreboard players reset @a be_player

# Kill compasses on the ground
kill @e[type=item,nbt={Item:{id:"minecraft:compass"}}]

# Set world spawn at Player so compass always points there
execute as @a[team=Player,limit=1] at @s run setworldspawn ~ ~ ~
execute as @a[team=Player,limit=1] at @s run effect give @s minecraft:speed 1 1 true
execute as @a[team=Player,limit=1] at @s run effect give @s minecraft:strength 1 1 true
execute as @a[team=Player,limit=1] at @s run effect give @s minecraft:regeneration 1 1 true

spawnpoint @a 0 0 0

execute store result score #pos_x player_pos run data get entity @e[team=Player,limit=1] Pos[0]
execute store result score #pos_y player_pos run data get entity @e[team=Player,limit=1] Pos[1]
execute store result score #pos_z player_pos run data get entity @e[team=Player,limit=1] Pos[2]

# execute as @a at @s run function hvp:show_pos_for_self

# Give compass back on death
# @e[type=player] targets only alive players, @a targets all players, regardless if they are alive or dead.
give @e[type=player,scores={deaths=1..},team=Hunters] compass
# execute as @e[type=player,scores={deaths=1..},team=Hunters] at @s run function hvp:spawngo
execute as @e[type=player,scores={deaths=1..},team=Hunters] run spreadplayers ~ ~ 256 1024 false @s
scoreboard players reset @e[type=player] deaths
gamerule keepInventory true