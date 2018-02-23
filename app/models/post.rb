class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title

  acts_as_votable

  scope :recent, -> { order('posts.created_at DESC').limit(10) }

  belongs_to :user
  belongs_to :community

  has_many :comments, dependent: :destroy

  has_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :link, presence: true
  validates :content, length: { minimum: 50 }
end
