class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github],
         :authentication_keys => {email: false, login: true}

  has_many :communities
  #has_many :members
  has_many :posts

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.username = auth.info.nickname
        user.bio = auth.extra.raw_info.bio
        user.github_profile_url = auth.info.urls.GitHub
        user.avatar_url = auth.info.image
    end
  end
end
