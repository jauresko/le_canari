class AddLastPaymentTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_payment_token, :string
  end
end
