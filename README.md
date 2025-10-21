# Rails Blog Application

## 概要 (Overview)
このアプリケーションは、学生が学びや日常を記録・共有するためのシンプルなブログプラットフォームです。Hotwireを活用したモダンなRailsアプリケーションとして構築されています。

---

## 機能一覧 (Features)
- **ユーザー認証機能**: Deviseを利用した安全な新規登録、ログイン、ログアウト機能。パスワード再設定にも対応しています。
- **記事投稿機能 (CRUD)**: ユーザーは自身の記事を作成(Create)、閲覧(Read)、更新(Update)、削除(Delete)できます。
- **画像アップロード機能**: Active Storageを利用し、記事に画像を添付できます。
- **フォロー機能**: 他のユーザーをフォローし、関係性を築くことができます。
- **無限スクロール**: PagyとHotwire(Turbo Frames)を組み合わせ、スムーズな無限スクロールによる記事閲覧体験を提供します。

---

## 使用技術 (Tech Stack)

### バックエンド (Backend)
- **プログラミング言語**: Ruby
- **フレームワーク**: Ruby on Rails
- **Webサーバー**: Puma
- **データベース**:
  - 開発・テスト環境: SQLite
  - 本番環境: PostgreSQL
- **認証**: Devise
- **画像処理**: Active Storage, image_processing
- **メール送信**: Mailgun

### フロントエンド (Frontend)
- **JavaScriptフレームワーク**: Hotwired (Turbo Rails, Stimulus)
- **CSSフレームワーク**: Bootstrap
- **CSSプリプロセッサ**: Sass (SCSS)

### テスト (Testing)
- **テストフレームワーク**: Minitest
- **E2E（統合）テスト**: Capybara, Selenium WebDriver

### 開発環境・その他 (Development & DevOps)
- **開発環境**: WSL (Windows Subsystem for Linux)
- **コード品質**: Solargraph (静的解析)
- **自動テスト実行**: Guard

### ER図
![ER図の概要](images/Rails_SNS_App_ER.drawio(2).png)

## 環境構築 (Setup)
1.  このリポジトリをクローンします。
    ```bash
    git clone [あなたのリポジトリURL]
    ```
2.  必要なgemをインストールします。
    ```bash
    bundle install
    ```
3.  データベースを作成・設定します。
    ```bash
    rails db:create db:migrate
    ```
4.  開発サーバーを起動します。
    ```bash
    bin/dev
    ```
5.  ブラウザで `http://localhost:3000` にアクセスします。

---

## テストの実行 (Testing)
以下のコマンドで、Minitestで記述されたテストを実行できます。

```bash
rails test
```

また、Guardを起動しておくと、ファイルの変更を検知して自動でテストが実行されます。

```bash
bundle exec guard
```