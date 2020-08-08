execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["hvp_spawn"],NoGravity:1b,Invisible:1b,Marker:1b}

tag @s add hvp_tpSpawn

execute as @e[tag=hvp_spawn,sort=nearest,limit=1] at @s store result entity @s Pos[0] double 1 run scoreboard players get @p spawn_x
execute as @e[tag=hvp_spawn,sort=nearest,limit=1] at @s store result entity @s Pos[1] double 1 run scoreboard players get @p spawn_y
execute as @e[tag=hvp_spawn,sort=nearest,limit=1] at @s store result entity @s Pos[2] double 1 run scoreboard players get @p spawn_z

execute as @e[tag=hvp_spawn,sort=nearest,limit=1] at @s run tp @s ~0.5 ~ ~0.5
execute as @e[tag=hvp_spawn,sort=nearest,limit=1] at @s run tp @a[tag=hvp_tpSpawn] @s

tag @a remove hvp_tpSpawn

kill @e[tag=hvp_spawn]


tellraw @s "Teleporting you back to spawn."
