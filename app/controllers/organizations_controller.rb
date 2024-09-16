class OrganizationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @organization = User.where(id: params[:id], role: "organización").first
    @review = Review.new
    if @organization.nil?
      #renderizar una pagina de error
    else
      @reviews = Review.where(organization_id: @organization.id)
    end
  end

  def average_rating
    reviews = Review.where(organization_id: @organization.id) # Obtiene todas las reviews de la organización actual
    if reviews.exists?
      reviews.average(:rating).to_f # Calcula el promedio del campo 'rating' y lo convierte a float
    else
      0 # Retorna 0 si no hay reviews
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
