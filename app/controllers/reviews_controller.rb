class ReviewsController < ApplicationController
  before_action :set_offer, only: %i[new create]
  def received_reviews
    # @reviews = Reviews.where(u, role: "organizaciones")
    @reviews = User.find(params[:id]).reviews
  end

  # poner en el routes:
  #member do
  #get :received_reviews
  #end
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.offer = @offer
    if @review.save
      redirect_to offer_path(@offer), notice: 'El review fue creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
