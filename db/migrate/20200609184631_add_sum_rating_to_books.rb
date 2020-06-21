class AddSumRatingToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :sum_rating, :integer
    add_column :books, :rating_number, :integer
    add_column :books, :average_rating, :integer
  end
end
