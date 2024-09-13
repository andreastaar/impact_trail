class ApplicationsController < ApplicationController
  before_action :set_offer, only: %i[new create]

  def index
    @applications = Application.where(user: current_user)
  end

  def new
    @application = Application.new
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    @application.offer = @offer
    @application.status = 'Iniciado'

    if @application.save
      redirect_to application_path(@application), notice: 'La aplicación fue realizada'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def application_params
    params.require(:application).permit(:status, :start_date, :end_date)
  end
end
