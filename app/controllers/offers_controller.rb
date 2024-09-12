class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = Offer.all

    if params[:query].present?
      @offers = @offers.search_by_offers(params[:query])
    end

    if params[:type_of_volunteering].present?
      @offers = @offers.where("type_of_volunteering ILIKE ?", params[:type_of_volunteering])
    end
  end

  def show
    @offer = Offer.find(params[:id])
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
    @offer.destroy
    redirect_to offers_url, notice: 'La oferta fue eliminada'
  end

  private

  def offer_params
  params.require(:offer).permit(:title, :description, :requirements, :address, :availability)
  end

end
