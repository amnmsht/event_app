# Event_app - 地域活性化イベントアプリ

## 説明
このアプリはプログラミングスクールのポートフォリオ作成課題で作成したものです。 地元を活性化する目的で地域に密着したイベント、空家、農地などの情報を提供します。アカウント登録していただくと、イベントの詳細の作成、閲覧、参加、お気に入り登録をすることができます。

## システム要件
* Rails 5.1.4
* ruby 2.4.0
* psql (PostgreSQL) 9.3
* Bootstrap3

## インストール手順
* 使用に当たっては以下の手順が必要になります。
* git@github.com:amnmsht/event_app.git
* cd event_app
* bundle install

## データベースのセットアップ
* このアプリ専用のデータベースをPostgreSQL 上に作成してください。
* rake db:create db:migrateを実行してください。

## システムの起動と終了
* rails s コマンドを実行するとシステムが起動します。
* Webブラウザでlocalhost:3000/を開くとトップページが表示されます。