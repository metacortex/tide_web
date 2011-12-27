class SoceryExternal < ActiveRecord::Migration
  def up
    create_table :authentications do |t|
      t.integer :user_id, :null => false
      t.string :provider, :uid, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :authentications
  end
end
