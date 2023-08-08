def preserve_music_albums_data(music_albums)
  return unless !music_albums.empty?
  File.write('./data-files/music_albums.json', JSON.generate(music_albums).to_s)
end

def preserve_genres_data(genres)
  return unless !genres.empty?
  File.write('./data-files/genres.json', JSON.generate(genres).to_s)
end