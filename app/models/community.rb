class Community < ApplicationRecord
  belongs_to :poster, class_name: 'User', foreign_key: 'user_id'
  #has_many :members
  #has_many :users, through: :members
  has_many :posts
  has_many :posters, through: :posts, source: :user
end
