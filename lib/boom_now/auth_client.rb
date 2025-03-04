class BoomNow::AuthClient
  def self.token
    Rails.cache.fetch('token', expires_in: 1.day) { BoomNow::Base.authenticate }
  end
end
