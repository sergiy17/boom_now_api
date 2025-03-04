class Boom::AuthClient
  def self.token
    Rails.cache.fetch('token', expires_in: 1.day) { Boom::Base.authenticate }
  end
end
