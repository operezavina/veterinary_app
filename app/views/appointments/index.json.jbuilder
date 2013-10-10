json.array!(@appointments) do |appointment|
  json.extract! appointment, :visit_date, :reminder_appo, :rason_visit, :doctor_id, :pet_id
  json.url appointment_url(appointment, format: :json)
end
