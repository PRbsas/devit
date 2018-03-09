class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description
  belongs_to :poster, serializer: UserCommunitySerializer
  has_many :posts
end
