class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :title

  belongs_to :poster, class_name: 'User', foreign_key: 'user_id'
  #has_many :members
  #has_many :users, through: :members
  has_many :posts, dependent: :destroy
  has_many :posters, through: :posts, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :short_description, length: { minimum: 100 }

  def self.by_created_at
    order('created_at DESC')
  end
end
