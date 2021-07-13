class Client::User < ApplicationRecord
  has_secure_password

  def self.login(email:, password:)
    user = find_by(email: email)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end
end
