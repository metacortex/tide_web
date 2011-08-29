class AddPictureToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :picture_image
    end
  end
end
