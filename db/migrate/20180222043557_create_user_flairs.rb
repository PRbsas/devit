class CreateUserFlairs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_flairs do |t|
      t.integer :user_id
      t.integer :flair_id
      t.string :experience_level

      t.timestamps
    end
  end
end
