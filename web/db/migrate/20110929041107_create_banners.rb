class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :category
      
      t.integer :event_id
      t.text :body
      
      t.timestamps
    end
    
    add_index :banners, :category
  end
end
