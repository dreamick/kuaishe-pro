# 快设助手 PRO

单文件前端工具，含 **AI 提示词 / 智能排版 / 多彩配色 / 极速抠图** 四个模块。
本目录已配置 GitHub Pages 自动部署（推送到 `main` 分支即生效）。

## 部署到 GitHub Pages

1. 在 GitHub 新建一个仓库（如 `kuaishe-pro`）。
2. 把本目录初始化为 git 仓库并推送：
   ```bash
   cd kuaishe-pro
   git init -q
   git add -A
   git commit -m "deploy 快设助手PRO"
   git branch -M main
   git remote add origin https://github.com/<你的用户名>/<仓库名>.git
   git push -u origin main
   ```
   （需先在本地执行 `gh auth login`，或配置 Personal Access Token。）
3. 仓库 **Settings → Pages → Source** 选择 **GitHub Actions**。
4. 等待 Actions 跑完，访问 `https://<你的用户名>.github.io/<仓库名>/`。

## AI 提示词扩写功能

在「AI 提示词」tab：
- 顶部 ⚙ 按钮（或首次点「AI 扩写」）打开设置，填入：
  - **API 地址（Base URL）**：任意 OpenAI 兼容接口，默认 `https://openrouter.ai/api/v1`
  - **API Key**：你的密钥（仅存于浏览器 localStorage，不会上传）
  - **模型**：如 `deepseek/deepseek-chat`
  - **扩写风格倾向**（可选）：如「电影感 / 写实摄影 / 二次元」
- 在「生成结果」区点 **AI 扩写**，会把当前提示词发给模型，返回更专业、更丰富的优化版本。

> 浏览器直连需服务端开启 CORS。若遇跨域报错，建议改用 OpenRouter，或把 Base URL 填成你自建的中转 / Cloudflare Worker 地址。
