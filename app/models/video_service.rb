class VideoService
  class << self
    def upload(path:, title:, token:)
      Yt.configuration.client_id = "826049932659-jelot8fvrvbl517r22k7lljfk37rbfq9.apps.googleusercontent.com"
      Yt.configuration.client_secret = "wojwdI4bCmBZERC0OVbLBUS_"
      account = Yt::Account.new access_token: token

      account.upload_video path, title: title
    end
  end
end