# Dockerfile
FROM node:18-alpine

WORKDIR /app

# プロジェクトの依存関係やビルドに必要なツールをインストール
RUN apk add --no-cache libc6-compat

# 作業ディレクトリを指定
WORKDIR /app

EXPOSE 3000

# 開発サーバー起動
CMD ["sh", "-c", "npm install && npm run dev"]