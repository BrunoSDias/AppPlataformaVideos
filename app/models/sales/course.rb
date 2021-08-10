class Sales::Course < ApplicationRecord
  has_one_attached :picture
  has_many :sales_videos, class_name: "Sales::Video"

  belongs_to :sales_seller, class_name: "Sales::Seller"
  belongs_to :admin_category, class_name: "Admin::Category"
end
