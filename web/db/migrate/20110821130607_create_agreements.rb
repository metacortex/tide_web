class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.integer :post_id
      t.integer :event_id
      t.belongs_to :comment
      t.belongs_to :user
      
      t.integer :direction, :default => 0
      
      t.timestamps
    end
    
    add_index :agreements, :post_id
    add_index :agreements, :event_id
    add_index :agreements, :comment_id
    add_index :agreements, :user_id
  end
end
