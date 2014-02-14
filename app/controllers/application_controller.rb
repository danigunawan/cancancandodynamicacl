class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_mail_host

  private
  def update_mail_host
    ActionMailer::Base.default_url_options = {:host => request.host_with_port}
  end
end
