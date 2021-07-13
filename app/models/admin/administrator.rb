class Admin::Administrator < ApplicationRecord
  has_secure_password

  def self.login(email:, password:)
    administrator = find_by(email: email)
    if administrator && administrator.authenticate(password)
      return administrator
    end
    return nil
  end
end
