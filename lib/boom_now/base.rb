class BoomNow::Base
  BASE_URL = 'https://app.boomnow.com/open_api/v1'.freeze

  def self.authenticate
    url = URI("#{BASE_URL}/auth/token")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Accept'] = 'application/json'
    request.body = { client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'] }.to_json

    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)['access_token']
    else
      raise "Authentication failed: #{response.code} - #{response.message} - #{response.body}"
    end
  end
end
