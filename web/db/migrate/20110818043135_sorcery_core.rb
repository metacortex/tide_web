class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.string :remember_me_token
      t.datetime :remember_me_token_expires_at

      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at
      t.datetime :reset_password_email_sent_at

      #
      t.string :name
      t.string :name_en

      t.string :work
      t.text :vision
      t.text :skills
      t.text :desc
      
      t.string :profile_image
      
      t.string :url_website
      t.string :url_facebook
      t.string :url_twitter
      t.string :url_googleplus
      t.string :url_linkedin
      
      t.string :role
      
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :name
    add_index :users, :name_en

    add_index :users, :remember_me_token
    add_index :users, :reset_password_token
  end

  def self.down
    drop_table :users
  end
end