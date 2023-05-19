#> ease:bezier/loop
#
# Bezier
#
# @within function ease:bezier/

# t = (t1 + t2) / 2
data modify storage ease: calcIn set from storage ease: _.ts
function ease:calc/add
data modify storage ease: calcIn set value {x:0f,y:2f}
data modify storage ease: calcIn.x set from storage ease: out
function ease:calc/div
data modify storage ease: _.t set from storage ease: out

# s = 1 - t
data modify storage ease: calcIn set value {x:1f,y:0f}
data modify storage ease: calcIn.y set from storage ease: _.t
function ease:calc/sub
data modify storage ease: _.s set from storage ease: out

# xm = (3*s*s*HANDLE1X+(3*s*HANDLE2X+t)*t)*t
    # x1 = 3*s*s*t*HANDLE1X
    data modify storage ease: calcIn.x set value 3f
    data modify storage ease: calcIn.y set from storage ease: _.s
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.s
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: in.bezier[0][0]
    function ease:calc/mul
    data modify storage ease: _.x1 set from storage ease: out
    # x2 = 3*s*t*t*HANDLE2X
    data modify storage ease: calcIn.x set value 3f
    data modify storage ease: calcIn.y set from storage ease: _.s
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: in.bezier[1][0]
    function ease:calc/mul
    data modify storage ease: _.x2 set from storage ease: out
    # x3 = t*t*t
    data modify storage ease: calcIn.x set from storage ease: _.t
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: _.x3 set from storage ease: out
    # x = (x1 + x2 + x3) * 1000
    data modify storage ease: calcIn.x set from storage ease: _.x1
    data modify storage ease: calcIn.y set from storage ease: _.x2
    function ease:calc/add
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.x3
    function ease:calc/add
    data modify storage ease: calcIn set value {x:0f,y:1000f}
    data modify storage ease: calcIn.x set from storage ease: out
    function ease:calc/mul
    data modify storage ease: _.x set from storage ease: out

# sub = ratio - x (負数になったらxのほうが大きい)
    data modify storage ease: calcIn.x set from storage ease: _.ratio
    data modify storage ease: calcIn.y set from storage ease: _.x
    function ease:calc/sub
    data modify storage ease: _.sub set string storage ease: out 0 1
# sub check
    execute if data storage ease: _{sub:"-"} run data modify storage ease: _.ts.y set from storage ease: _.t
    execute unless data storage ease: _{sub:"-"} run data modify storage ease: _.ts.x set from storage ease: _.t

# loop
    execute store result storage ease: _.loop int 1 run data get storage ease: _.loop 0.9999999999
    execute unless data storage ease: _{loop:0} run function ease:bezier/loop
