def read_music_albums_json
  if File.exist?('music_albums.json') && !File.empty?('music_albums.json')
    JSON.parse(File.read('music_albums.json'))
  else
    []
  end
end