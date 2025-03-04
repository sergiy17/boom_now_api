class BoomApi::Listings < Micro::Case::Strict
  attributes :params

  def call!
    result = Boom::Client.get('listings', params)

    if result.is_a?(Hash)
      Success(result: { listings: result['listings'] })
    else
      Failure(result: { errors: "Failed to fetch listings" })
    end
  end
end
