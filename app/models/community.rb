class Community < ApplicationRecord
  # extend FriendlyId
  # friendly_id :title

  belongs_to :poster, class_name: 'User', foreign_key: 'user_id'

  has_many :posts, dependent: :destroy
  has_many :posters, through: :posts, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :short_description, length: { minimum: 50 }

  def self.by_created_at
    order('created_at DESC')
  end

  def next
    next_community = self.class.where('id > ?', id).first
	  next_community ? next_community : self.class.first
  end
end
