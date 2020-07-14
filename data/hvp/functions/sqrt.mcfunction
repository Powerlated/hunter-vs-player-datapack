scoreboard players operation @s sqrtX += @s sqrtI
scoreboard players add @s realDistance 1
scoreboard players add @s sqrtI 2
execute as @s if score @s distance > @s sqrtX run function hvp:sqrt