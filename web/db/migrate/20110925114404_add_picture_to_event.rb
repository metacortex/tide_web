class AddPictureToEvent < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :picture_image
    end
  end
end
