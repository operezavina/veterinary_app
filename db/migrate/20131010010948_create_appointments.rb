class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :visit_date
      t.boolean :reminder_appo
      t.text :rason_visit
      t.references :doctor, index: true
      t.references :pet, index: true

      t.timestamps
    end
  end
end
