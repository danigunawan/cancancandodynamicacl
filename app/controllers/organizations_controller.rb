class OrganizationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @users = @organization.users
  end
end
