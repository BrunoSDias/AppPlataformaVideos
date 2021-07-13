class Admin::Category < ApplicationRecord
  belongs_to :admin_administrator, class_name: "Admin::Administrator"
  has_many :sales_courses, class_name: "Sales::Course"
end
