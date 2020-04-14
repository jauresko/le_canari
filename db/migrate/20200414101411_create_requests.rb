class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :editor
      t.string :author
      t.string :drawer
      t.date :release_date
      t.string :collection
      t.references :user
      t.timestamps
    end
  end
end
