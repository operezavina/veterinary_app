class AddCustomerToPets < ActiveRecord::Migration
  def change
    add_column :pets, :customer, :string
  end
end
