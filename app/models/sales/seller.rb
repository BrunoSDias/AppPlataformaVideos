class Sales::Seller < ApplicationRecord
  has_secure_password
  validates :nome, :email, presence: true
  validates_uniqueness_of :email, :cpf

  def self.login(email:, password:)
    seller = find_by(email: email)
    if seller && seller.authenticate(password)
      return seller
    end
    return nil
  end
end
