## 已将所有循环更新的内容都写入了init文件，弃用了此文件

# This is the main function, that will run once per tick
# 调用所有功能的main方法，每tick更新
# 创建队伍
team add red
team add blue

# 设置队伍颜色和前缀
team modify blue color blue
team modify blue prefix "Counter-Terrorists"
team modify red color yellow
team modify red prefix "Terrorists"


# 发送确认信息给所有玩家
tellraw @a {"text":"点击此处确认加入分队","color":"green","clickEvent":{"action":"run_command","value":"/function counterstrikesforminecraft:join"}}

# 确认加入分队的命令
# (这个函数将在玩家点击确认后运行)
function counterstrikesforminecraft:join

# 清除确认状态
scoreboard objectives remove confirm

# 平衡随机分队逻辑
# (这个函数将在所有玩家确认后运行)
function counterstrikesforminecraft:balanced_random_teams
