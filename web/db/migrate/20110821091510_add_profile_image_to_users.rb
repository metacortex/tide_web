class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :profile_image
    end
  end
end
