class AddRememberTokenToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :remember_token, :string
  end
end
