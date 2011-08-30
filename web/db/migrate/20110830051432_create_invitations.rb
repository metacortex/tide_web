class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.string :email
      t.string :kind
      t.text :message
      t.string :code
      t.timestamp :accepted_at
      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :email
    add_index :invitations, :code
  end
end
