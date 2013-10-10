json.array!(@pets) do |pet|
  json.extract! pet, :name, :type, :breed, :age, :weight, :visit_date
  json.url pet_url(pet, format: :json)
end
