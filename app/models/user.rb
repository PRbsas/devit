class User < ApplicationRecord
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github],
         :authentication_keys => {email: false, login: true}

  has_many :communities

  has_many :posts
  has_many :contributions, through: :posts, source: :community

  has_many :comments

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

  def show_name
    self.username || self.name || self.email
  end

  def show_avatar
    self.avatar_url ? self.avatar_url : "https://github.com/identicons/#{SecureRandom.hex}.png"
  end

  def self.by_sign_in
    order('last_sign_in_at DESC')
  end
end
