class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session, except: :all
  
protected

  def add_callback
    return unless params[:callback]
    response['Content-Type'] = 'application/javascript'
    response.body = "/**/%s(%s)" % [params[:callback], response.body]
  end
end
