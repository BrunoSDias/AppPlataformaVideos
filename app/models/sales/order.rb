class Sales::Order < ApplicationRecord
  belongs_to :client_user, class_name: "Client::User", foreign_key: :client_user_id
  belongs_to :sales_course, class_name: "Sales::Course", foreign_key: :sales_course_id

  enum status: { aguardando: 1, pago: 2 }
end
