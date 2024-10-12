# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #prepend_before_action :check_captcha, only: [:create]

  include CaptchaConcern

  ALLOWED_EXCEPTIONS = [Faraday::Error, Net::ReadTimeout, Net::OpenTimeout].freeze

  private

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end

    def check_captcha
      unless valid_captcha? || valid_recaptcha?
        self.resource = resource_class.new sign_in_params
        resource.validate
        set_minimum_password_length
        resource.errors.add(:base, 'Верификация не пройдена. Попробуйте снова.')
        render :new, status: :unprocessable_entity
      end
    end
end
