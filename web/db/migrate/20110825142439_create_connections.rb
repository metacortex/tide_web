class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :connection_type
      t.string :remark
      t.timestamp :accepted_at
      t.timestamps
    end
    
    add_index :connections, :user_id
    add_index :connections, :target_id
    add_index :connections, :connection_type
  end
end
