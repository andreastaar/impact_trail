class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :show, :update]
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = Offer.all

    if params[:query].present?
      @offers = @offers.search_by_offers(params[:query])
    end

    if params[:type_of_volunteering].present?
      @offers = @offers.where("unaccent(type_of_volunteering) ILIKE unaccent(?)", params[:type_of_volunteering])
    end
  end

  def show
    @application = Application.new
    @offers = Offer.where(id: params[:id])
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end

  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to @offer, notice: 'La oferta fue creada exitosamente'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'La oferta fue actualizada exitosamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find_by(id: params[:id])
    @offer.destroy
    redirect_to offers_url, notice: 'La oferta fue eliminada'
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :requirements, :country_name, :city, :type_of_volunteering,
      :perks, :address, :availability, :start_date, :end_date, photos: [])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
