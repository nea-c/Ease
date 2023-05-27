#> ease:calc/sub
#
# inに設定されたデータを元に減算します。
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


data modify storage ease: _.minus set string storage ease: _.transformation.scale[2] 0 1
execute unless data storage ease: _{minus:"-"} store result storage ease: _.abc_bigger int 1 run data get storage ease: calcIn.x 1
execute if data storage ease: _{minus:"-"} store result storage ease: _.abc_bigger int -1 run data get storage ease: calcIn.y 1
data modify storage ease: _.minus set string storage ease: _.abc_bigger 0 1

# 正の場合
execute unless data storage ease: _{minus:"-"} run data modify storage ease: out set from storage ease: _.transformation.scale[1]

# 負の場合
execute if data storage ease: _{minus:"-"} run data modify storage ease: _.matrix set value [1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f]
execute if data storage ease: _{minus:"-"} run data modify storage ease: _.matrix[3] set from storage ease: _.transformation.scale[1]
execute if data storage ease: _{minus:"-"} run data modify entity @s transformation set from storage ease: _.matrix
execute if data storage ease: _{minus:"-"} run data modify storage ease: out set from entity @s transformation.translation[0]
