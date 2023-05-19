#> ease:bezier/
#
# Bezier
#
# @within function ease:display

# t1,t2 = 0,1
    data modify storage ease: _.ts set value {x:0f,y:1f}

# ratio = now / duration * 1000
    data modify storage ease: calcIn.x set from storage ease: in.tick.x
    data modify storage ease: calcIn.y set from storage ease: in.tick.end
    function ease:calc/div
    data modify storage ease: calcIn set value {x:0f,y:1000f}
    data modify storage ease: calcIn.x set from storage ease: out
    function ease:calc/mul
    data modify storage ease: _.ratio set from storage ease: out


# loop
    data modify storage ease: _.loop set value 10
    function ease:bezier/loop


# calc.max = max - min
    data modify storage ease: calcIn.x set from storage ease: in.value.max
    data modify storage ease: calcIn.y set from storage ease: in.value.min
    function ease:calc/sub
    data modify storage ease: _.max set from storage ease: out


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

# y = (3*s*s*HANDLE1Y+(3*s*HANDLE2Y+t)*t)*t
    # y1 = 3*s*s*t*HANDLE1Y
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
    data modify storage ease: calcIn.y set from storage ease: in.bezier[0][1]
    function ease:calc/mul
    data modify storage ease: _.y1 set from storage ease: out
    # y2 = 3*s*t*t*HANDLE2Y
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
    data modify storage ease: calcIn.y set from storage ease: in.bezier[1][1]
    function ease:calc/mul
    data modify storage ease: _.y2 set from storage ease: out
    # y3 = t*t*t
    data modify storage ease: calcIn.x set from storage ease: _.t
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.t
    function ease:calc/mul
    data modify storage ease: _.y3 set from storage ease: out
    # y = y1 + y2 + y3
    data modify storage ease: calcIn.x set from storage ease: _.y1
    data modify storage ease: calcIn.y set from storage ease: _.y2
    function ease:calc/add
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.y3
    function ease:calc/add

    # out = x * calc.max + min
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: _.max
    function ease:calc/mul
    data modify storage ease: calcIn.x set from storage ease: out
    data modify storage ease: calcIn.y set from storage ease: in.value.min
    function ease:calc/add
