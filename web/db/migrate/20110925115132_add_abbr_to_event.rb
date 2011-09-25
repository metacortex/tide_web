class AddAbbrToEvent < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.text :abbr
    end
  end
end
