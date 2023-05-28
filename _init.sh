#!/bin/bash

source /.scripts_config

# 配置目录数组
directories=(
  "/home/docker"
  "/root"
  "/home/lei"
)

# 遍历目录进行操作
for directory in "${directories[@]}"; do
  if [ -d "$directory/_init" ]; then
    find "$directory/_init" -type f -name "*.sh" -exec bash {} \;
  fi

  if [ -f "$directory/_init.sh" ]; then
    bash "$directory/_init.sh"
  fi

  echo "[$(now)] 目录 $directory 处理完成"
done

alias ssc=systemctl
alias jnc=journalctl