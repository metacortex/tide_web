class AddPictureToEvent < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :poster_image
      t.string :picture_image
    end
  end
end
