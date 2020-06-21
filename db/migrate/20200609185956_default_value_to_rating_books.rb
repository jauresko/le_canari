class DefaultValueToRatingBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :sum_rating, :integer, :default => 0
    change_column :books, :rating_number, :integer, :default => 0
    change_column :books, :average_rating, :integer, :default => 0
  end
end
