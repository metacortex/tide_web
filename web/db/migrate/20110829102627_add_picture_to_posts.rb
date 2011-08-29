class AddPictureToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :picture
    end
  end
end
