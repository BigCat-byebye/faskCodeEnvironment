# faskCodeEnvironment
一键式快速创建开发环境——基于docker-compose

1. code镜像中具备常用前后端开发工具，curl,wget,pnpm,npm,python3等，均设置国内源
2. mysql以及redis镜像均已link到code中，mysql账号免密，见.env.example文件
3. code和mysql以及redis数据均持久化到data目录下

## 使用方法
1. mv .env.example .env
2. docker-compose up -d
3. 使用vscode的remote ssh链接开发环境即可，账号密码见.env中