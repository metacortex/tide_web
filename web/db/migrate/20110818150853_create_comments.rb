class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.string :content_type
      t.integer :content_id
      
      t.text :body
      
      t.integer :agreements_count, :default => 0
      t.integer :positive_agreements_count, :default => 0
      t.integer :negative_agreements_count, :default => 0

      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, [:content_type, :content_id]
  end
end
