class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :event_id
      
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :desc
      
      t.string :status
      t.string :reg_type
      
      t.string :attachment
      
      t.timestamps
    end
    
    add_index :registrations, :event_id
  end
end
