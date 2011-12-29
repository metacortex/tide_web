class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :category_id
      t.timestamps
    end
    
    add_index :tags, :name, :unique => true
    add_index :tags, :category_id
  end
end
