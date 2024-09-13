class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
      # @users = User.where(location: params[:location])
      # @user = User.new
      # @status = current_user.applications.status
      # @offer_location = Application.offer.location
  end

  def offer_locations
    # if applications.status == "ACEPTADO"
      @users = User.joins(applications: :offer).where("offers.city ILIKE ?", "%#{params[:location]}%").where(applications: { status: 'ACEPTADO' }).distinct
    # else
    #   "NO TIENE OFERTAS ACEPTADAS"
    # end
  end

end
