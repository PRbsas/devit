class UserFlair < ApplicationRecord
  belongs_to :user
  belongs_to :flair

  validates :experience_level, presence: true
end
