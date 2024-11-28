# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_locale

  private

  def set_current_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
