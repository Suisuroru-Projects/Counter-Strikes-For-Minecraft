# 平衡随机分队逻辑
# 初始化随机数为0
scoreboard objectives add random dummy
scoreboard players set @s random 0

# 计算当前队伍人数
scoreboard objectives add red_count dummy
scoreboard objectives add blue_count dummy
scoreboard players set _red_count red_count 0
scoreboard players set _blue_count blue_count 0

execute as @a[team=red] run scoreboard players add _red_count red_count 1
execute as @a[team=blue] run scoreboard players add _blue_count blue_count 1

# 根据当前队伍人数分配玩家
execute as @a[scores={confirm=1}] if score _red_count red_count < _blue_count blue_count run team join red
execute as @a[scores={confirm=1}] if score _red_count red_count >= _blue_count blue_count run team join blue

# 如果队伍人数仍然不平衡，再次随机分配
execute as @a[scores={confirm=1}] if score _red_count red_count < _blue_count blue_count run execute store result score @s random run random value 1..100

# 清除确认和随机分数
scoreboard players reset @a confirm
scoreboard players reset @s random
scoreboard players reset _red_count red_count
scoreboard players reset _blue_count blue_count

# 通知所有玩家他们的队伍
tellraw @a {"selector":"@a[team=red]","text":"你现在是反恐精英！"}
tellraw @a {"selector":"@a[team=blue]","text":"你现在是恐怖分子！"}
