class OrganizationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @organizations = Organization.all
  end
end
