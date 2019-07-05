class RenameMicropostColumnToLikes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :Likes, :micropostid, :micropost_id
  end
end
