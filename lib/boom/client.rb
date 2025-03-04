require 'uri'
require 'net/http'

class Boom::Client < Boom::Base
  def self.get(path, params)
    uri = URI.parse("#{BASE_URL}/#{path}")

    uri.query = URI.encode_www_form(params.to_h)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri)

    request['Authorization'] = "Bearer #{Boom::AuthClient.token}"
    request['Content-Type'] = 'application/json'
    request['Accept'] = 'application/json'

    response = http.request(request)

    JSON.parse(response.body)
  end
end
