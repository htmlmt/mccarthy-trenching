json.array!(@shows) do |show|
  json.extract! show, :id, :date, :description
  json.url show_url(show, format: :json)
end
