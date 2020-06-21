class DeleteColumToBooksAndEpisodes < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :cover
    remove_column :episodes, :pages
  end
end
