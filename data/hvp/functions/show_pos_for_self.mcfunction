execute store result score @s X run data get entity @s Pos[0]
execute store result score @s Y run data get entity @s Pos[1]
execute store result score @s Z run data get entity @s Pos[2]

# Get Hunters coordinates ready for subtraction
scoreboard players operation @s X_diff = @s X
scoreboard players operation @s Y_diff = @s Y
scoreboard players operation @s Z_diff = @s Z

# Calculate differences with subtraction
execute at @a[team=Player] run scoreboard players operation @s X_diff -= @p X
execute at @a[team=Player] run scoreboard players operation @s Y_diff -= @p Y
execute at @a[team=Player] run scoreboard players operation @s Z_diff -= @p Z

# Square differences
scoreboard players operation @s X_diff *= @s X_diff
scoreboard players operation @s Y_diff *= @s Y_diff
scoreboard players operation @s Z_diff *= @s Z_diff

# Use "distance" variable to store sum of differences
scoreboard players operation @s distance = @s X_diff
scoreboard players operation @s distance += @s Y_diff
scoreboard players operation @s distance += @s Z_diff

# Reset square root variables
scoreboard players set @a sqrtI 1
scoreboard players set @a sqrtX 0
scoreboard players set @a realDistance 0

# Calculate square root
execute as @a if score @s distance > @s sqrtX run function hvp:sqrt

execute if entity @a[team=Player,nbt={Dimension:"minecraft:overworld"}] run title @s[team=Hunters] actionbar [{"text":"Player Coords: ","color":"aqua"},{"score":{"name":"#pos_x","objective":"player_pos"}, "color":"gold"}," ",{"score":{"name":"#pos_y","objective":"player_pos"}, "color":"gold"}," ",{"score":{"name":"#pos_z","objective":"player_pos"}, "color":"gold"}," <",{"score":{"name":"@s","objective":"realDistance"}, "color":"gold"}," blocks>"]
execute if entity @a[team=Player,nbt={Dimension:"minecraft:the_nether"}] run title @s[team=Hunters] actionbar [{"text":"Player Coords: ","color":"aqua"},"<",{"text":"in the Nether","color":"gold"},">"]
execute if entity @a[team=Player,nbt={Dimension:"minecraft:the_end"}] run title @s[team=Hunters] actionbar [{"text":"Player Coords: ","color":"aqua"},"<",{"text":"in the End","color":"gold"},">"]



