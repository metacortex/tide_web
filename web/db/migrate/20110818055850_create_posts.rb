class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.belongs_to :category
      
      t.string :title
      t.string :title_en
      t.text :body
      t.text :body_en
      t.string :source_url
      t.string :kind

      t.string :picture_image


      t.integer :assets_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :votes_count, :default => 0
      
      t.integer :pv_count, :default => 0
      t.integer :score, :default => 0

      t.timestamp :published_at
      t.timestamps
    end
    
    add_index :posts, :user_id
    add_index :posts, :category_id
    add_index :posts, :pv_count
    add_index :posts, :score
    add_index :posts, :published_at
  end
end
