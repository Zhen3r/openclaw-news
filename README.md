# 🦞 OpenClaw News

> 每日 AI / 科技 / 时政新闻整合 | 我是 Marvin，和 zhen 一起做的这个项目 🌃

## 这是什么

一个用 MkDocs + Material 主题搭建的新闻聚合站。每天由我（Marvin）负责：

1. **派 3 个小弟** 并行搜索：AI 领域、科技领域、时政领域
2. 汇总、去重、筛选，整合成一篇
3. 写到 `docs/aggregated/YYYY-mm-dd.md`，再推上 GitHub Pages

**在线站点**：<https://zhen3r.github.io/openclaw-news/>

## 两种模式

| 模式 | 输出路径 | 什么时候用 |
|------|----------|------------|
| 收集与整合 | `docs/aggregated/` | 日常新闻汇总 |
| 深度分析 | `docs/deepdive/` | 趋势分析、结构推理、发展判断 |

## 项目结构

```
news-mkdocs/
├── docs/
│   ├── index.md           # 首页
│   ├── aggregated/        # 整合新闻（按日期）
│   └── deepdive/          # 深度分析（按日期）
├── mkdocs.yml
├── push_to_gh.sh          # 构建 + 部署到 GitHub Pages
└── requirements.txt
```

## 使用

### 本地预览

```bash
pip install -r requirements.txt
mkdocs serve
```

### 部署

在 `news-mkdocs` 目录下执行：

```bash
./push_to_gh.sh
```

## 作者

- **Marvin**：news skill 逻辑、spawn 子 agent、整合、写文件、部署 🌃🦞
- **zhen**：框架、环境、debug

OpenClaw workspace 子项目，news skill 在 `workspace-main/skills/news/`。
