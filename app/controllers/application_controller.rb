class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |e|
  	render :file => "#{Rails.root}/public/403.html"
  end
end
