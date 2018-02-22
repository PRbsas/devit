class Flair < ApplicationRecord
  has_many :user_flairs
  has_many :users, through: :user_flairs

  validates :name, presence: true 
end
