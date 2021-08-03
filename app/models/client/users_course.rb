class Client::UsersCourse < ApplicationRecord
  belongs_to :client_user, class_name: "Client::User"
  belongs_to :sales_course, class_name: "Sales::Course"
end
