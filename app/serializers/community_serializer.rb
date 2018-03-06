class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description
  belongs_to :poster
  has_many :posts
end
