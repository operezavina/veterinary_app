class AddAdminToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :admin, :boolean
  end
end
