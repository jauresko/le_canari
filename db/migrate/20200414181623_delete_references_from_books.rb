class DeleteReferencesFromBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :book

  end
end
