class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :user
      t.belongs_to :post
      t.string :name
      t.timestamps
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, :user_id
    add_index :taggings, :post_id
  end
end
