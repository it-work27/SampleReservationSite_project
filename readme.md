【各種ダウンロード】
1  任意のフォルダにSampleReservationSite_projectをgit clone
https://github.com/it-work27/SampleReservationSite_project.git

2  frontendフォルダにてSampleReservationSite_frontendをgit clone
https://github.com/it-work27/SampleReservationSite_frontend.git

3  backendフォルダにてSampleReservationSite_backendをgit clone
https://github.com/it-work27/SampleReservationSite_backend.git

4  pwdをSampleReservationSite_projectフォルダにして、以下コマンド実行
docker-compose build
docker-compose up -d

【コンテナセットアップ】
5  起動したDBコンテナに入り、以下コマンド実行
psql -U user -d postgres -f /app/init.sql 
6  起動したフロントエンドコンテナに入り、以下コマンド実行
npm run dev
7  起動したバックエンドコンテナに入り、以下コマンド実行
node server.js

【動作確認】
8  ブラウザにてlocalhost:30000にアクセス。
9  loginページが表示されるので、"user1" "password1"でログイン
10 検索画面が表示されるので、各種入力して検索し予約確認画面へ進む
11 予約確認画面で予約確定後、ヘッダーのhomeから予約済み一覧を確認
12 予約済み一覧から詳細を確認
