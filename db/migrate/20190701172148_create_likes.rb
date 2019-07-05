class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :userid
      t.integer :micropostid

      t.timestamps
    end
  end
end
