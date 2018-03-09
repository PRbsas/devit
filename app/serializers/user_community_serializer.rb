class UserCommunitySerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :name
end
