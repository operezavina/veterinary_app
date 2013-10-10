class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.decimal :age
      t.decimal :weight
      t.date :visit_date

      t.timestamps
    end
  end
end
