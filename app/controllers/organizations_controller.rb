class OrganizationsController < ApplicationController


  def show
    @organization = User.find(params[:id])
    @reviews = @organization.reviews
  end

end
