class AddRankingDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :posts_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :agreements_count, :default => 0
      t.integer :votes_count, :default => 0

      t.integer :rank, :default => 0
      t.integer :ranking, :default => 0
      
      t.integer :score, :default => 0
      t.integer :score_week, :default => 0
      t.integer :score_month, :default => 0
      t.integer :score_year, :default => 0
    end

    add_index :users, :rank
    add_index :users, :ranking
    add_index :users, :score
    add_index :users, :score_week
    add_index :users, :score_month
    add_index :users, :score_year
  end
end
