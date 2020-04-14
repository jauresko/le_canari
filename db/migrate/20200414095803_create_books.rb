class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :editor
      t.string :author
      t.string :drawer
      t.date :release_date
      t.string :collection

      t.timestamps
    end
  end
end
