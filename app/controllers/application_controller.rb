class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session, except: :all

  # Requires access token for all requests
  #before_action :ensure_permission

  # Allow jsonp for all actions
  after_action :add_callback
  
protected

  def add_callback
    return unless params[:callback]
    response['Content-Type'] = 'application/javascript'
    response.body = "/**/%s(%s)" % [params[:callback], response.body]
  end

  def ensure_permission
    api_key = ApiKey.where(access_token: params[:access_token]).where(expired_at: nil).first
    head 401 unless api_key
  end
end
