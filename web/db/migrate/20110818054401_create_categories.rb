class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :title
      t.string :title_en
      
      t.integer :posts_count, :default => 0
      
      t.timestamps
    end
    
    add_index :categories, :name
  end
end
