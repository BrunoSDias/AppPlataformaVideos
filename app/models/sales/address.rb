class Sales::Address < ApplicationRecord
  belongs_to :sales_seller, class_name: "Sales::Seller"

  validates_presence_of :rua, :numero, :estado, :cep, :bairro
  validates :numero, uniqueness: { scope: :cep }
end
