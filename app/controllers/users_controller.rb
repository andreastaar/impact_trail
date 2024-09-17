class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
      # @users = User.where(location: params[:location])
      # @user = User.new
      # @status = current_user.applications.status
      # @offer_location = Application.offer.location
  end

  def offer_locations
      @users = User.joins(applications: :offer).where("offers.city ILIKE ?", "%#{params[:location]}%").where(applications: { status: 'Aceptado' }).distinct
  end

end
