json.array!(@songs) do |song|
  json.extract! song, :id, :name, :artist, :song_type
  json.url song_url(song, format: :json)
end
