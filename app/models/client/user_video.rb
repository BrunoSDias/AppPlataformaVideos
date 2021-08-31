class Client::UserVideo < ApplicationRecord
  belongs_to :client_user, class_name: "Client::User"
  belongs_to :sales_video, class_name: "Sales::Video"
end
