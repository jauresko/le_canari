class AddSynopsisToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :synopsis, :string
  end
end
