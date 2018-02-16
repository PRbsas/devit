class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :title
      t.text :short_description
      t.integer :user_id

      t.timestamps
    end
  end
end
