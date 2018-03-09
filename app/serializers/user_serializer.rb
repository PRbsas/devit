class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :communities
  has_many :posts
  has_many :comments
  has_many :flairs, serializer: FlairSerializer
  has_many :user_flairs
end
