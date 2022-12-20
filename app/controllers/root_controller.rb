class RootController < ApplicationController

  # GET /
  def index
    p 'aqui'
    render json: {'message': 'REST Back-end Challenge 20201209 Running'}
  end

end
