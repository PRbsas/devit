class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :title
      t.text :short_description

      t.timestamps
    end
  end
end
