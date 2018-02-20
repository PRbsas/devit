class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community

  has_many :comments

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :link, presence: true
  validates :content, length: { minimum: 100 }
end
