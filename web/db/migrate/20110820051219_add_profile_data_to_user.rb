class AddProfileDataToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name_e
      t.string :location
      t.string :category
      t.text :website
      t.string :work
      t.string :interest
    end
    
    add_index :users, :category
    add_index :users, :name_e
  end
end
