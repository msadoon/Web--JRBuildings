json.array!(@cheques) do |cheque|
  json.extract! cheque, :id
  json.url cheque_url(cheque, format: :json)
end
