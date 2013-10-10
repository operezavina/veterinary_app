class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :school
      t.decimal :experience

      t.timestamps
    end
  end
end
