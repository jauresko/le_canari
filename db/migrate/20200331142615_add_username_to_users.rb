class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :username, :string
    add_column :users, :status, :string
    add_column :users, :company_name, :string
    add_column :users, :company_number, :string
    add_column :users, :phone_number, :string
  end
end
