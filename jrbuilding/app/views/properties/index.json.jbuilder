json.array!(@properties) do |property|
  json.extract! property, :id, :building_id, :number, :buildingnumber, :suitedfor, :notes, :rented
  json.url property_url(property, format: :json)
end
