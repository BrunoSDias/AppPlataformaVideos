class Admin::Administrator < ApplicationRecord
  has_secure_password
  validates :nome, :email, presence: true
  validates_uniqueness_of :email, :cpf

  def self.login(email:, password:)
    administrator = find_by(email: email)
    if administrator && administrator.authenticate(password)
      return administrator
    end
    return nil
  end
end
