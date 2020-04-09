class AddReferencesToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :review, foreign_key: true
  end
end
