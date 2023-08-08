def read_music_albums_json
  if File.exist?('./data-files/music_albums.json') && !File.empty?('./data-files/music_albums.json')
    JSON.parse(File.read('./data-files/music_albums.json'))
  else
    []
  end
end

def read_genres_json
  if File.exist?('./data-files/genres.json') && !File.empty?('./data-files/genres.json')
    JSON.parse(File.read('./data-files/genres.json'))
  else
    []
  end
end