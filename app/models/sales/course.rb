class Sales::Course < ApplicationRecord
  belongs_to :sales_seller, class_name: "Sales::Seller"
end
