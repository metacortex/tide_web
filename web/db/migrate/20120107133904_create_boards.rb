class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.string :user_username
      
      t.string :title
      t.text :body
      t.string :body_format
      
      t.string :image_1
      t.string :image_2
      t.string :image_3
      
      t.string :mode
      t.string :category
      t.string :device
      
      t.integer :pv_count, :default => 0
      t.integer :comments_count, :default => 0
      
      t.timestamps
    end

    add_index :boards, :user_id
    add_index :boards, :user_username
    add_index :boards, :title
    add_index :boards, :mode
    add_index :boards, :category
    add_index :boards, :pv_count
    add_index :boards, :created_at
  end
end
