class ApplicationController < ActionController::Base
  protect_from_forgery

  ActionMailer::Base.default_url_options = {:host => request.host_with_port}
end
