# Next.js + MySQL + phpMyAdmin Docker Setup

## 環境構成
- Next.js
- Node.js 18
- MySQL 8.0
- phpMyAdmin
- Docker & Docker Compose

## 初期セットアップ手順

### 1. プロジェクトディレクトリの作成
```bash
mkdir nextjs-docker-project
cd nextjs-docker-project
```

### 2. 必要なファイルの配置
以下のファイルを作成してください：
- Dockerfile
- docker-compose.yml
- .env
- .gitignore

### 3. Next.jsプロジェクトの作成
```bash
docker compose run web npx create-next-app@latest . --typescript --tailwind --eslint
```

### 4. コンテナのビルドと起動
```bash
docker compose up -d --build
```

## 開発用コマンド

### コンテナの起動
```bash
docker compose up -d
```

### コンテナの停止
```bash
docker compose down
```

### ログの確認
```bash
# 全てのログを見る
docker compose logs

# Next.jsのログのみ確認
docker compose logs web -f
```

### コンテナ内でコマンドを実行
```bash
# パッケージのインストール
docker compose exec web npm install [パッケージ名]

# Prismaマイグレーション
docker compose exec web npx prisma migrate dev
```

## アクセス情報

### Next.js
- URL: http://localhost:3000

### phpMyAdmin
- URL: http://localhost:8080
- ユーザー名: root
- パスワード: rootpassword

### MySQL接続情報
- ホスト: db
- データベース: nextjs_db
- ユーザー: user
- パスワード: password
- ポート: 3306

## トラブルシューティング

### コンテナが起動しない場合
```bash
# コンテナの状態確認
docker compose ps

# ログの確認
docker compose logs
```

### ボリュームやイメージをクリーンアップする場合
```bash
# 全てのコンテナを停止
docker compose down

# ボリュームも含めて削除
docker compose down -v

# キャッシュを使わずに再ビルド
docker compose build --no-cache
```

## 注意事項
- 本番環境では必ずパスワードを変更してください
- .envファイルはGitにコミットしないようにしてください
- M1 Macユーザーの場合、docker-compose.ymlの platform: linux/arm64 設定が必要です

## 開発のヒント
- `docker compose exec web` を使用してコンテナ内でコマンドを実行できます
- ホットリロードが有効なので、コードの変更は自動的に反映されます
- MySQLのデータは `mysql_data` ボリュームに永続化されます