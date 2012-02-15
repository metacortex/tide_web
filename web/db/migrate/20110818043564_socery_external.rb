class SoceryExternal < ActiveRecord::Migration
  def up
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :access_token

      t.timestamps
    end
  end

  def down
    drop_table :authentications
  end
end
