class AddRankingDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :posts_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :agreements_count, :default => 0
      t.integer :votes_count, :default => 0
      t.integer :score_all, :default => 0
      t.integer :score_total, :default => 0
      t.integer :score_week, :default => 0
      t.text :score
      t.integer :ranking_all, :default => 0
      t.integer :ranking_total, :default => 0
      t.integer :ranking_week, :default => 0
    end
    add_index :users, :ranking_all
    add_index :users, :ranking_total
    add_index :users, :ranking_week
    add_index :users, :score_all
    add_index :users, :score_total
    add_index :users, :score_week
  end
end
