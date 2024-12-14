class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!, only: [:new, :create], if: :user_signed_in?

  allow_browser versions: :modern

  def restrict_registration
    redirect_to root_path, alert: "El registro está deshabilitado." # Redirige a la página de inicio
  end
end
