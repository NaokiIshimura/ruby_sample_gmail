# Gmail Api

## 公式
### Ruby Quickstart
https://developers.google.com/gmail/api/quickstart/ruby
### APIリファレンス
http://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/GmailV1

## 準備
1. [Ruby Quickstart](https://developers.google.com/gmail/api/quickstart/ruby)の「Step 1: Turn on the Gmail API」を実施して、『client_secret.json』をディレクトリ内に配置する
```
$ cd ruby_sample_gmail 
$ ls -l
-rw-r--r--@ 1 xxx  yyy   435  5  3 12:00 client_secret.json
```
2. 「google-api-client」をインストールする
```
$ gem install google-api-client
```

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
