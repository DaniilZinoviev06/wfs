# devise registration controller methods with captcha

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #prepend_before_action :check_captcha, only: [:create]

  include CaptchaConcern

  ALLOWED_EXCEPTIONS = [Faraday::Error, Net::ReadTimeout, Net::OpenTimeout].freeze

  private

    def sign_up_params
      params.require(:user).permit :nickname, :password, :email
    end

    def check_captcha
      unless valid_captcha? || valid_recaptcha?
        self.resource = resource_class.new sign_up_params
        resource.validate
        set_minimum_password_length
        resource.errors.add(:base, 'Верификация не пройдена. Попробуйте снова.')
        render :new, status: :unprocessable_entity
      end
    end
end
