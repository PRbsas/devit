class AddProfileAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :github_profile_url, :string
    add_column :users, :avatar_url, :string
  end
end
