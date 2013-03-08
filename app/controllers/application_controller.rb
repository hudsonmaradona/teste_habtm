class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

    layout Proc.new { |controller| controller.devise_controller? ? 'authentication' : 'application' }

end
