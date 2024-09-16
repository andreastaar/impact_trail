class ReviewsController < ApplicationController

  def received_reviews
    @reviews = User.find(params[:id]).reviews
    @user = :user_id
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @organization = User.find(params[:review][:organization_id])
    if @review.save
      redirect_to organization_path(@organization), notice: 'El review fue creado con éxito.'
    else
      flash[:alert] = "Algo salió mal."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :organization_id)
  end

end
