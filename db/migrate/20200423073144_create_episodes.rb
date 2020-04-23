class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :episode_number
      t.references :book
      t.timestamps
    end
  end
end
