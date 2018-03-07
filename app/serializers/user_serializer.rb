class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :communities
  has_many :posts
  has_many :comments
end
