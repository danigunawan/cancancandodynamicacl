class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_mail_host

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referer, :alert => exception.message
  end

  private
  def update_mail_host
    ActionMailer::Base.default_url_options = {:host => request.host_with_port}
  end
end
