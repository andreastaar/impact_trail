class OrganizationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @average_rating = average_rating
    @organizations = User.where(id: params[:id], role: "organización")
    @organization = User.where(id: params[:id], role: "organización").first
    @review = Review.new
    @reviews = Review.where(organization_id: @organization.id)

    # The `geocoded` scope filters only flats with coordinates
    @markers = @organizations.geocoded.map do |organization|
      {
        lat: organization.latitude,
        lng: organization.longitude
      }
    end
  end

  def average_rating
    if Review.where(organization_id: params[:id]).map(&:rating).count > 0
      return (Review.where(organization_id: params[:id]).map(&:rating).sum / Review.where(organization_id: params[:id]).map(&:rating).count).round(1)
    end
  end

  def my_offers
    @my_offers = current_user.offers
  end

end
