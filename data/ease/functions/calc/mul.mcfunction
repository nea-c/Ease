#> ease:calc/mul
#
# inに設定されたデータを元に乗算します。
#
# @within function
#       ease:bezier/
#       ease:bezier/loop



data modify storage ease: _.matrix set value [1f,0f,0f,1f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]

data modify storage ease: _.matrix[15] set from storage ease: calcIn.y

data modify entity @s transformation set from storage ease: _.matrix


data modify storage ease: _.matrix[3] set from storage ease: calcIn.x
data modify storage ease: _.matrix[15] set from entity @s transformation.translation[0]


data modify entity @s transformation set from storage ease: _.matrix
data modify storage ease: out set from entity @s transformation.translation[0]
