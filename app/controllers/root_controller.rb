class RootController < ApplicationController
  include ::Authenticator

  # GET /
  def index
    render json: {'message': 'REST Back-end Challenge 20201209 Running'}
  end

end
