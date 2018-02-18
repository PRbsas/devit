class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.belongs_to :user
      t.belongs_to :community

      t.timestamps
    end
  end
end
