#!/usr/bin/env bash
# 构建 MkDocs 并部署到 GitHub Pages
# 使用方法: 在 news-mkdocs 目录下执行 ./push_to_gh.sh

set -e
# export http_proxy=http://v2ray-v2ray-1:1110
# export https_proxy=http://v2ray-v2ray-1:1110
export ALL_PROXY=socks5h://v2ray-v2ray-1:1010

ssh-keyscan github.com >> /home/node/.ssh/known_hosts

cd "$(dirname "$0")"

# 默认 Python 路径（可通过环境变量 PYTHON 覆盖）
PYTHON="${PYTHON:-/app/.pyenv/bin/python}"

# 检查并安装依赖
check_install() {
  if ! "$PYTHON" -c "import mkdocs" 2>/dev/null; then
    echo "MkDocs 未安装，正在安装依赖..."
    "$PYTHON" -m pip install -r requirements.txt --quiet
  else
    echo "MkDocs 已安装 ✓"
  fi
}

check_install

# 添加 title 到每个文件
for dir in docs/aggregated docs/deepdive; do
  for f in "$dir"/*.md; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .md)

    if ! grep -q "^title:" "$f"; then
      tmp=$(mktemp)
      {
        echo "---"
        echo "title: $name"
        echo "---"
        echo
        cat "$f"
      } > "$tmp"
      mv "$tmp" "$f"
    fi
  done
done

echo "Building MkDocs..."
"$PYTHON" -m mkdocs build

echo "Deploying to GitHub Pages..."
"$PYTHON" -m mkdocs gh-deploy --force

echo "Your documentation should shortly be available at: https://zhen3r.github.io/openclaw-news/"
