#!/bin/bash

# 定义颜色，方便查看输出
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}开始配置 Ubuntu Fcitx5 + Rime 自然码双拼环境...${NC}"

# 1. 安装必要的软件包
echo -e "${GREEN}[1/6] 正在安装 Fcitx5 和 Rime 双拼数据...${NC}"
sudo apt update
sudo apt install -y fcitx5 fcitx5-chinese-addons fcitx5-rime librime-data-double-pinyin im-config

# 2. 设置 Fcitx5 为系统默认输入法
echo -e "${GREEN}[2/6] 设置 Fcitx5 为默认输入法...${NC}"
im-config -n fcitx5

# 确保配置目录存在
mkdir -p ~/.local/share/fcitx5/rime
mkdir -p ~/.config/fcitx5/conf
mkdir -p ~/.config/fcitx5

# 3. 配置 Rime：只保留自然码双拼
echo -e "${GREEN}[3/6] 配置 Rime：只保留自然码双拼...${NC}"
cat > ~/.local/share/fcitx5/rime/default.custom.yaml <<EOF
patch:
  schema_list:
    - schema: double_pinyin      # 只保留自然码双拼
  menu/page_size: 9              # 候选词数量设为 9
EOF

# 4. 配置 Rime：强制默认简体
echo -e "${GREEN}[4/6] 配置 Rime：强制锁定简体中文...${NC}"
cat > ~/.local/share/fcitx5/rime/double_pinyin.custom.yaml <<EOF
patch:
  switches:
    - name: ascii_mode
      reset: 0
      states: [ 中文, 西文 ]
    - name: full_shape
      states: [ 半角, 全角 ]
    - name: simplification
      reset: 1                # 1 表示默认简体
      states: [ 漢字, 汉字 ]
    - name: ascii_punct
      states: [ 。，, ．， ]
EOF

# 5. 配置 Fcitx5 UI：修改字体大小 (设为 16)
echo -e "${GREEN}[5/6] 修改候选词字体大小为 16...${NC}"
# 注意：这会覆盖旧的 UI 配置文件
cat > ~/.config/fcitx5/conf/classicui.conf <<EOF
# 垂直候选列表
Vertical Candidate List=False
# 字体设置 (Sans 16, 你可以根据需要修改数字)
Font="Sans 16"
# 根据屏幕 DPI 自动缩放
EnableFractionalScale=True
EOF

# 6. 配置 Fcitx5 全局：添加英文键盘 & 开启"程序独立记忆"
echo -e "${GREEN}[6/6] 添加英文键盘并开启程序独立记忆...${NC}"

# 先停止 fcitx5 进程，防止配置文件被覆盖
killall fcitx5 2>/dev/null

# 写入 profile 文件：设置 英文(第一位) 和 Rime(第二位)
# 注意：这会重置你的输入法列表顺序
cat > ~/.config/fcitx5/profile <<EOF
[Groups/0]
Name=Default
Default Layout=us
DefaultIM=keyboard-us

[Groups/0/Items/0]
Name=keyboard-us
Layout=

[Groups/0/Items/1]
Name=rime
Layout=

[GroupOrder]
0=Default
EOF

# 修改全局 config 开启"按程序记忆输入状态"
# 如果 config 文件不存在，先创建一个空的
touch ~/.config/fcitx5/config
# 使用 sed 修改 SwitchMode，如果没有则追加
if grep -q "SwitchMode=" ~/.config/fcitx5/config; then
    sed -i 's/SwitchMode=.*/SwitchMode=Program/' ~/.config/fcitx5/config
else
    # 如果没有 Behavior 字段，简单追加可能位置不对，但通常有效
    # 稳妥起见，如果找不到直接重写一个基础配置
    echo "[Behavior]" >> ~/.config/fcitx5/config
    echo "ShareInputState=Program" >> ~/.config/fcitx5/config
fi

echo -e "${GREEN}配置完成！${NC}"
echo -e "${GREEN}正在尝试重启 Fcitx5...${NC}"

# 后台启动 fcitx5
fcitx5 -d &
sleep 2
# 触发 Rime 部署
fcitx5-remote -r

echo -e "${GREEN}----------------------------------------${NC}"
echo -e "${GREEN}全部搞定！请注意：${NC}"
echo -e "1. 建议您现在 **注销并重新登录** 或者是 **重启电脑** 以确保所有设置完美生效。"
echo -e "2. 重启后，使用 Super(Win)+空格 切换输入法。"
echo -e "3. 您的候选词字体已加大，只保留了自然码，且默认为简体。"
echo -e "${GREEN}----------------------------------------${NC}"