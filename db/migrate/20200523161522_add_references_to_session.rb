class AddReferencesToSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :episode, index: true
  end
end
