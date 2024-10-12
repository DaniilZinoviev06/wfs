# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    @user = User.provider_create(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url, alert: 'Ошибка при авторизации через ВКонтакте.'
    end
  end

  def google_oauth2
    @user = User.provider_create(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url, alert: 'Ошибка при авторизации через Google.'
    end
  end

  def yandex
    @user = User.provider_create(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url, alert: 'Ошибка при авторизации через Yandex.'
    end
  end
end
