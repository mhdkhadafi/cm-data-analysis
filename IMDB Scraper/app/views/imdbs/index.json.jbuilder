json.array!(@imdbs) do |imdb|
  json.extract! imdb, :id
  json.url imdb_url(imdb, format: :json)
end
