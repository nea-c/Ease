#> ease:display
#
#
# @within function ease:


# out remove
    data remove storage ease: out

# Bezier
    execute if data storage ease: in.bezier run function ease:bezier/

# Elastic
    execute if data storage ease: in.elastic run function ease:elastic/

# Bounce
    execute if data storage ease: in.bounce run function ease:bounce/

# kill
    kill @s