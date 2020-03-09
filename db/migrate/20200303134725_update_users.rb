class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password, :string

    add_column :users, :password_digest, :string

    # add_column  :password_reset_token, :string
    # add_column  :password_reset_set_at, :datetime
    # add_column  :role, :string
    # add_column  :active, :boolean, default: true

  end
end
