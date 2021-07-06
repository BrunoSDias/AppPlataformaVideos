class Sales::Seller < ApplicationRecord
  has_secure_password

  def self.login(email:, password:)
    seller = find_by(email: email)
    if seller && seller.authenticate(password)
      return seller
    end
    return nil
  end
end
