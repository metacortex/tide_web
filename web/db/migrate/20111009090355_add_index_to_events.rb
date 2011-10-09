class AddIndexToEvents < ActiveRecord::Migration
  def change
    add_index :events, :opened_at
    add_index :events, :closed_at
  end
end
