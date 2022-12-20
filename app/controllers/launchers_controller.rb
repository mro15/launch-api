class LaunchersController < ApplicationController
  include ::Authenticator

  before_action :set_launch, only: [:show, :update, :destroy]


  # GET /launchers
  def index
    @launchers = Launch.page(params[:page]).per(params[:per_page])
    render json: @launchers
  end

  def show
    render json: @launch
  end

  # PUT /launchers/:launchId
  def update
    if @launch.update(launch_params)
      render json: @launch
    else
      render json: @launch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /launchers/:launchId
  def destroy
    @launch.destroy
    render json: {}, status: :ok
  end

  def launch_params
    params.require(:launch).permit(
      :status,
      :url,
      :name,
      :net,
      :slug,
      :window_end,
      :window_start,
      :inhold,
      :tbddate,
      :tbdtime,
      :probability,
      :holdreason,
      :failreason,
      :hashtag,
      :webcast_live,
      :image,
      :infographic,
      :program
    )
  end

  def set_launch
    @launch = Launch.where(id: params[:id]).first
    render json: {}, status: :not_found if @launch.blank?
    @launch
  end

end
