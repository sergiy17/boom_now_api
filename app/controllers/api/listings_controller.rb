class Api::ListingsController < ApplicationController
  def search
    result = BoomApi::Listings.call(params: search_params)

    if result.success?
      render json: { result: result.data[:listings] }
    else
      render json: { errors: result.data[:errors] }, status: :unprocessable_entity
    end
  end

  private

  def search_params
    params.permit(:city, :adults)
  end
end