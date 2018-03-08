class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :content, :user_id, :community_id
  has_many :comments
end
