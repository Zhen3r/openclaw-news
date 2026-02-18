#!/usr/bin/env bash
# 构建 MkDocs 并部署到 GitHub Pages
# 使用方法: 在 news-mkdocs 目录下执行 ./push_to_gh.sh

set -e
cd "$(dirname "$0")"

# 加载 config.env（若存在）以统一 Python 路径
[ -f config.env ] && source config.env

# 默认 Python 路径（可通过环境变量 PYTHON 覆盖）
PYTHON="${PYTHON:-/home/node/.venv/bin/python}"

# 检查并安装依赖
check_install() {
  if ! "$PYTHON" -c "import mkdocs" 2>/dev/null; then
    echo "MkDocs 未安装，正在安装依赖..."
    "$PYTHON" -m pip install -r requirements.txt
  else
    echo "MkDocs 已安装 ✓"
  fi
}

check_install

echo "Building MkDocs..."
"$PYTHON" -m mkdocs build

echo "Deploying to GitHub Pages..."
"$PYTHON" -m mkdocs gh-deploy --force

echo "Done. Site should be live in a few minutes."
