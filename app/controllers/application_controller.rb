class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  protected
  
  def after_sign_in_path_for(user)
    subdomain = user.subdomain.name
    root_url(:subdomain => subdomain)
  end
  
  def after_sign_out_path_for(user)
    root_url(:subdomain => nil)
  end
end
