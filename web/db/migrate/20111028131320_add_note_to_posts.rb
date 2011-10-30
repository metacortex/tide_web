class AddNoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :edit_status, :string
    add_column :posts, :edit_note, :text
    
    add_index :posts, :edit_status
  end
end
