class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[vkontakte google_oauth2 yandex]
  
  def self.provider_create(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.nickname = "#{auth.info.first_name} #{auth.info.last_name}".strip
      user.email = auth.info.email 
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end


