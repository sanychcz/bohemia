class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  layout :layout_by_resource

    protected

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end

    private

    def set_locale
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end

    #def extract_locale_from_accept_language_header
      #case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      #when 'en'
        #'en'
      #when 'cs'
        #'cs'
      #when 'ru'
        #'ru'
      #else
        #'en'
      #end  
    #end

    def default_url_options(options={})
      { :locale => I18n.locale == I18n.default_locale ? session[:locale] : I18n.locale  }
    end
end