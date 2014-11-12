json.array!(@reviews) do |review|
  json.extract! review, :id, :qua_id, :total_score, :quality_score, :convinience_score, :cost_score, :sight_score, :comment, :photo_data, :photo_title
  json.url review_url(review, format: :json)
end
