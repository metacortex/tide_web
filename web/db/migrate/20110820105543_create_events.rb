class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      
      t.string :event_type
      
      t.integer :comments_count, :default => 0
      
      t.timestamp :opened_at
      t.timestamp :closed_at
      t.timestamps
    end

    add_index :events, :event_type

    # table: comments
    add_column :comments, :event_id, :integer
    add_index :comments, :event_id
  end
end
