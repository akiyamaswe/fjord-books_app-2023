# frozen_string_literal: true

class LocalesController < ApplicationController
  def change
    locale = params[:locale].to_sym
    session[:locale] = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
    redirect_to request.referer
  end
end
