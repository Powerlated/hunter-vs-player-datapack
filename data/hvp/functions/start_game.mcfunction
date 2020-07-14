title @a title "Starting game..."
# fill -2 63 -2 2 63 2 bedrock replace
spreadplayers 0 0 512 1024 true @a

execute as @a[team=Hunters] run tellraw @a ["<",{"selector":"@s","color":"red"},"> Ready or not, here I come!"]
execute as @a[team=Player] run tellraw @a ["<",{"selector":"@s","color":"blue"},"> Ready or not, here they come!"]
give @a[team=Hunters] compass 1

effect give @a minecraft:saturation 10 10
effect give @a minecraft:regeneration 10 10