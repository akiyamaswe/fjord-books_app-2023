# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action do
    I18n.locale = :ja # Or whatever logic you use to choose.
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username postal_code address self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username postal_code address self_introduction])
  end

  def after_sign_in_path_for(_resource)
    books_path
  end
end
