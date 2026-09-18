#!/bin/bash
# 快设助手PRO · 一键上传到线上（GitHub Pages）
# 双击本文件即可：自动 git add / commit / push 当前仓库
# 沿用本机已配置的 SSH，无需 Token，上传的是干净源码
cd "$(dirname "$0")" || exit 1
clear
echo "════════════════════════════════════"
echo "   快设助手PRO · 一键上传到线上"
echo "════════════════════════════════════"

# 从源文件同步最新改动到 index.html（仅当源文件更新时才覆盖，避免回退）
SRC="/Users/dreamick/工作文档/快设助手PRO.html"
if [ -f "$SRC" ]; then
  if [ "$SRC" -nt "index.html" ]; then
    cp "$SRC" index.html
    echo "↻ 已从源文件同步最新内容到 index.html"
  else
    echo "✓ 源文件无更新，沿用当前 index.html"
  fi
else
  echo "⚠️ 未找到源文件，沿用当前 index.html"
fi

git add -A

# 没有改动则跳过
if git diff --cached --quiet; then
  echo "✓ 没有新改动，无需上传。"
else
  MSG="update: 自动同步 $(date '+%Y-%m-%d %H:%M:%S')"
  if git commit -m "$MSG" >/dev/null 2>&1; then
    echo "✓ 已提交：$MSG"
  else
    echo "⚠️ 提交失败，请查看上方信息。"
    read -n 1 -s -r -p "按任意键关闭..."
    echo ""
    exit 1
  fi
  if git push origin main 2>&1 | tee /tmp/kuaishe_deploy.log; then
    echo ""
    echo "🚀 上传成功！线上约 1-2 分钟后生效，强刷即可看到。"
  else
    echo ""
    echo "⚠️ 上传失败（详见上方）。若提示本地落后，请先 git pull 再试。"
  fi
fi

echo ""
read -n 1 -s -r -p "按任意键关闭窗口..."
echo ""
