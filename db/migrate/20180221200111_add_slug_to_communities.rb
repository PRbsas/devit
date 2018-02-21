class AddSlugToCommunities < ActiveRecord::Migration[5.1]
  def change
    add_column :communities, :slug, :string, after: :id
  end
end
