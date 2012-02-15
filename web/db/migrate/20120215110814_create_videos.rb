class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :desc
      t.string :vimeo_uid
      t.integer :duration
      t.string :thumb_large
      t.string :thumb_medium
      t.string :thumb_small

      t.timestamps
    end
    
    add_index :videos, :created_at
  end
end
