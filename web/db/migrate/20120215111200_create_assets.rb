class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :source
      t.string :attachment
      t.timestamps
    end
    
    add_index :assets, :name
    add_index :assets, :source
    add_index :assets, :created_at
  end
end
