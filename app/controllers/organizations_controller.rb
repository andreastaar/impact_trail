class OrganizationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @average_rating = average_rating
    @organization = User.where(id: params[:id], role: "organización").first
    @review = Review.new
    if @organization.nil?
      #renderizar una pagina de error
    else
      @reviews = Review.where(organization_id: @organization.id)
    end


    @marker =
      {
        lat: @organization.latitude,
        lng: @organization.longitude
      }

  end

  def average_rating
    if Review.where(organization_id: params[:id]).map(&:rating).count > 0
    return (Review.where(organization_id: params[:id]).map(&:rating).sum / Review.where(organization_id: params[:id]).map(&:rating).count).round(1)
    end
  end

  def my_offers
    @my_offers = current_user.offers
  end




  # def create_review
  #   @review = Review.new(review_params)
  #   @revier.user = current_user
  #   @review.offer = @offer
  #   if @review.save
  #     redirect_to offer_path(@offer), notice: 'El review fue creado con éxito.'
  #   else
  #     flash[:alert] = "Something went wrong."
  #     render :new, status: :unprocessable_entity
  #   end
  # end

end
