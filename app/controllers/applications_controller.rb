class ApplicationsController < ApplicationController
  before_action :set_offer, only: %i[new create]

  def create
    @application = Application.new(application_params)
    @application.offer = @offer
    @application.user = current_user
    if @application.save
      redirect_to offer_path(@offer), notice: 'La aplicación fue realizada'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def application_params
    params.require(:application).permit(:status)
  end
end
