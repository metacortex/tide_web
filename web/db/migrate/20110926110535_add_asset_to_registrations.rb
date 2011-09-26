class AddAssetToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :asset, :string
  end
end
