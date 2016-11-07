class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #layout :layout_by_resource



  def after_sign_in_path_for(resource)
    if resource.policy.present?
      policy_path(resource.policy)
    else
      new_policy_path
    end
  end



  protected

  def layout_by_resource
    if params[:controller] == "welcome"
      "application"
    else
      "old"
    end
  end
end
