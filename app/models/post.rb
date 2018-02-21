class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community

  has_many :comments

  has_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :link, presence: true
  validates :content, length: { minimum: 100 }
end
