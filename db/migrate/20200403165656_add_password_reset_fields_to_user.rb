class AddPasswordResetFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_set_at, :timestamp
  end
end
