class LaunchersController < ApplicationController
  include ::Authenticator

  before_action :set_launch, only: [:show, :update, :destroy]


  # GET /launchers
  def index
    @launchers = Launch.page(params[:page]).per(params[:per_page])
    render json: @launchers
  end

  def show
    render json: @launch, include: ['*', 'rocket.rocket_configuration', 'mission.orbit', 'pad.location']
  end

  # PUT /launchers/:launchId
  def update
    if @launch.update(launch_params)
      update_direct_associations(@launch)
      render json: @launch, include: ['*', 'rocket.rocket_configuration', 'mission.orbit', 'pad.location']
    else
      render json: @launch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /launchers/:launchId
  def destroy
    @launch.destroy
    render json: {}, status: :ok
  end

  private

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

  # Allows to update the mission and pad associations
  def launch_extra_params
    return {} if params[:launch].nil?
    params[:launch].permit(
      mission: [:name, :description, :launch_designator, :mission_type],
      pad: [:url, :name, :info_url, :wiki_url, :map_url]
    )
  end

  # update mission fields and pad fields
  def update_direct_associations(launch)
    mission_fields = launch_extra_params[:mission]
    if !launch.mission.nil? and mission_fields
      launch.mission.name = mission_fields[:name] ? mission_fields[:name] : launch.mission.name
      launch.mission.description = mission_fields[:description] ? mission_fields[:description] : launch.mission.description
      launch.mission.launch_designator = mission_fields[:launch_designator] ? mission_fields[:launch_designator] : launch.mission.launch_designator
      launch.mission.mission_type = mission_fields[:mission_type] ? mission_fields[:mission_type] : launch.mission.mission_type
      launch.mission.save
    end
    pad_fields = launch_extra_params[:pad]
    if !launch.pad.nil? and pad_fields
      launch.pad.url = pad_fields[:url] ? pad_fields[:url] : launch.pad.url
      launch.pad.name = pad_fields[:name] ? pad_fields[:name] : launch.pad.name
      launch.pad.info_url = pad_fields[:info_url] ? pad_fields[:info_url] : launch.pad.info_url
      launch.pad.wiki_url = pad_fields[:wiki_url] ? pad_fields[:wiki_url] : launch.pad.wiki_url
      launch.pad.map_url = pad_fields[:map_url] ? pad_fields[:map_url] : launch.pad.map_url
      launch.pad.save
    end
  end

  def set_launch
    @launch = Launch.where(id: params[:id]).first
    render json: {}, status: :not_found if @launch.blank?
    @launch
  end

end
