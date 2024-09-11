class OrganizationsController < ApplicationController

  def show
    @organization = User.where(id: params[:id], role: "organización").first
    @review= Review.new
    if @organization.nil?
      #renderizar una pagina de error
    else
      @reviews = Review.where(organization_id: @organization.id)
    end
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
