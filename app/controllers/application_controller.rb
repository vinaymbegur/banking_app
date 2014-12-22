class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def after_sign_in_path_for(user)
    if cookies["last_visit"]
    	cookies["last_visit"]
    else
    	root_path
    end
  end

  def after_sign_out_path_for(user)
    cookies.delete "last_visit" if cookies["last_visit"]
    root_path
  end
  
end
