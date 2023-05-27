#> ease:calc/add
#
# inに設定されたデータを元に加算します。
#
# @within function
#       ease:bezier/
#       ease:bezier/loop


data modify storage ease: _.matrix set value [1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]

data modify storage ease: _.matrix[0] set from storage ease: calcIn.x
data modify storage ease: _.matrix[1] set from storage ease: calcIn.y
data modify storage ease: _.matrix[4] set from storage ease: calcIn.y
data modify storage ease: _.matrix[5] set from storage ease: calcIn.x

data modify entity @s transformation set from storage ease: _.matrix
data modify storage ease: _.transformation set from entity @s transformation


data modify storage ease: _.sign set string storage ease: _.transformation.left_rotation[0] 0 1

# 正の場合
execute unless data storage ease: _{sign:"-"} run data modify storage ease: out set from storage ease: _.transformation.scale[0]

# 負の場合
execute if data storage ease: _{sign:"-"} run data modify storage ease: _.matrix set value [1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f]
execute if data storage ease: _{sign:"-"} run data modify storage ease: _.matrix[3] set from storage ease: _.transformation.scale[0]
execute if data storage ease: _{sign:"-"} run data modify entity @s transformation set from storage ease: _.matrix
execute if data storage ease: _{sign:"-"} run data modify storage ease: out set from entity @s transformation.translation[0]

