class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      t.text :abbr
      
      t.string :poster_image
      t.string :thumb_image
      t.string :picture_image
      
      
      t.string :category
      t.string :status
      
      t.integer :comments_count, :default => 0
      
      t.timestamp :opened_at
      t.timestamp :closed_at
      t.timestamps
    end

    add_index :events, :name
    add_index :events, :category
    add_index :events, :opened_at
    add_index :events, :closed_at
  end
end
