json.array!(@quas) do |qua|
  json.extract! qua, :id, :name, :latitude, :longitude, :quality, :effect, :url, :stay_required, :price, :image1_caption, :image1
  json.url qua_url(qua, format: :json)
end
