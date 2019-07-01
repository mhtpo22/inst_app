class AddProfileimageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profileimage, :string
  end
end
