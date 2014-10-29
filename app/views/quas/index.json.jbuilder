json.array!(@quas) do |qua|
  json.extract! qua, :id, :name, :latitude, :longitude, :quality, :effect, :url
  json.url qua_url(qua, format: :json)
end
