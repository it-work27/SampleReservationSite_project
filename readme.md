# README.md

# 動作確認方法

## 各種ダウンロード
1.  任意のフォルダにSampleReservationSite_projectをgit clone
```bash
https://github.com/it-work27/SampleReservationSite_project.git
```
2.  frontendフォルダにてSampleReservationSite_frontendをgit clone
```bash
https://github.com/it-work27/SampleReservationSite_frontend.git
```
3.  backendフォルダにてSampleReservationSite_backendをgit clone
```bash
https://github.com/it-work27/SampleReservationSite_backend.git
```
4.  pwdをSampleReservationSite_projectフォルダにして、以下コマンド実行
```bash
docker-compose build
docker-compose up -d
```
## コンテナセットアップ
1.  起動したDBコンテナに入り、以下コマンド実行
```bash
psql -U user -d postgres -f /app/init.sql 
```
2.  起動したフロントエンドコンテナに入り、以下コマンド実行
```bash
npm run dev
```
3.  起動したバックエンドコンテナに入り、以下コマンド実行
```bash
node server.js
```

## 動作確認
1.  ブラウザにてlocalhost:30000にアクセス。
1.  loginページが表示されるので、"user1" "password1"でログイン
1. 検索画面が表示されるので、各種入力して検索し予約確認画面へ進む
1. 予約確認画面で予約確定後、ヘッダーのhomeから予約済み一覧を確認
1. 予約済み一覧から詳細を確認

## その他
- 処理概要としては、ログイン後に車両の予約ができるサイト
- ユーザーページから予約状況の参照可能
- projectリポジトリのopenapi.yml、sequence.puには主要な処理概要を記載

### アーキテクチャ
Next.js + Node.js + postgresql

### 以下については未対応
- 予約後のメール通知などは実施しない
- Web上での支払い機能実装はしない
- レンタル時間帯ごとの値段変更なども行わない
- 予約の変更もWebでは不可
- パスワード規則などは考慮しない（サンプルのためハッシュ化・暗号化なども割愛）
- ユーザー登録機能は作成しない
