#!/usr/bin/env bash

TARGET="mod.nix"

# 检查当前目录下是否有 nix 文件
if ! ls *.nix >/dev/null 2>&1; then
    echo "错误: 当前目录下没有找到 .nix 文件。"
    exit 1
fi

echo "正在更新 $TARGET ..."

# 写入文件头
cat > "$TARGET" <<EOF
{ config, pkgs, ... }:

{
  imports = [
EOF

# 遍历当前目录下的所有 .nix 文件
# sort 确保引入顺序一致（美观）
for file in *.nix; do
    # 排除 mod.nix 自身，防止无限递归
    if [[ "$file" != "$TARGET" ]]; then
        echo "    ./$file" >> "$TARGET"
    fi
done

# 写入文件尾
cat >> "$TARGET" <<EOF
  ];
}
EOF

echo "更新完成！"

git add .
echo "git 添加 完成"
