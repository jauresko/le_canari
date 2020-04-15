class AddDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :admin, :boolean, :default => false
    #Ex:- :default =>''
    change_column :users, :company, :boolean, :default => false
    #Ex:- :default =>''
  end
end
