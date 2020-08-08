title @a title "Starting game..."
title @a subtitle "Good luck!"
spreadplayers 0 0 512 5000 true @a

gamemode survival @a
clear @a
time set day

execute as @a[team=Hunters] run tellraw @a ["<",{"selector":"@s","color":"red"},"> Ready or not, here I come!"]
execute as @a[team=Player] run tellraw @a ["<",{"selector":"@s","color":"blue"},"> Ready or not, here they come!"]
execute at @a[team=Player,limit=1] run spreadplayers ~ ~ 0 256 false @a[team=Hunters]
give @a[team=Hunters] compass 1

execute as @a at @s run function hvp:spawnstore

effect clear @a
effect give @a minecraft:saturation 10 10
effect give @a minecraft:regeneration 10 10