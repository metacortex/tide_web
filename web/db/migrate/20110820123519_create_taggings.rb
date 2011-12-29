class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.string :content_type
      t.integer :content_id
      t.integer :tag_id
      t.string :name
      t.string :category
      t.timestamps
    end
    
    add_index :taggings, [:content_type,:content_id]
    add_index :taggings, :tag_id
    add_index :taggings, :name
    add_index :taggings, :category
  end
end
