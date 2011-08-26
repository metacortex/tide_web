class AddConnectionsCountToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :connections_count, :default => 0
    end
  end
end
