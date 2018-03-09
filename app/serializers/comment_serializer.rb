class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id

  belongs_to :user
  belongs_to :post, serializer: PostCommentSerializer
end
