class Admin::Category < ApplicationRecord
  belongs_to :admin_administrator, class_name: "Admin::Administrator"
  has_many :sales_courses, class_name: "Sales::Course", foreign_key: :admin_administrator_id

  validates :nome, presence: true, uniqueness: true
end
