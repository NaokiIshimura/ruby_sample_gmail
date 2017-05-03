require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Gmail API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "gmail-ruby-quickstart.yaml")
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::GmailV1::GmailService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

##
# Gmailからメールを取得する
#
user_id = 'me'

# 検索条件
# https://support.google.com/mail/answer/7190?hl=en
# example
# query = 'after:2017/01/01 before:2017/01/31 is:read'
# query = "to:google-noreply@google.com"
query = "from:google-noreply@google.com"

# 検索を実行
results = service.list_user_messages(user_id, q: query)

# 検索結果のメッセージ（複数）から、メッセージの内容を取得する
results.messages.each do |result|

  puts 'id:'+ message_id = result.id
  message = service.get_user_message(user_id, message_id)

  # headerの取得
  headers = message.payload.headers
  # headerからsubjectを取り出す
  headers.each do |header|
    puts 'header:' + header.value if header.name == 'Subject'
  end

  # parts(body)の取得
  parts = message.payload.parts
  parts.each do |part|
    puts 'message:' + part.body.data if part.mime_type == "text/plain"
  end

end
