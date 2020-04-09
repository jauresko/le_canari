class AddReferencesToSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :book, foreign_key: true
    add_reference :sessions, :user, foreign_key: true
  end
end
