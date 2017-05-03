# Gmail Api

## 公式
### Ruby Quickstart
https://developers.google.com/gmail/api/quickstart/ruby
### APIリファレンス
http://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/GmailV1

## 実行
1. 実行する
```
# ラベル一覧を表示する
# (内容はQuickstartのサンプルコード)
$ ruby list_user_labels.rb 
```
or
```
# メールを検索して、件名と本文を表示する
$ ruby get_user_message.rb 
```

2. 初回は認証用のURLが表示されるのでブラウザでアクセスする
```
Open the following URL in the browser and enter the resulting code after authorization
https://accounts.google.com/o/oauth2/auth?...
```

3. ブラウザで認証を許可する
4. ブラウザで表示されるコードをコンソールにコピーしてEnterキーを押下する

## 補足
実行結果が↓のようになった場合は、過去の認証情報を削除する必要がある。
```
Token client ID of xxx does not match configured client id yyy
```

1. 認証情報が保存されてるディレクトリに移動
```
# Quickstartの場合
$ cd ~/.credentials
```

2. 認証情報を削除
```
$ rm gmail-ruby-quickstart.yaml
```
