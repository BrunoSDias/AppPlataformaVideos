class Sales::Video < ApplicationRecord
  belongs_to :sales_course, class_name: "Sales::Course"
end
