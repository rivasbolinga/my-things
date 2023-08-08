def display_music_albums_on_list_all_music_album(music_albums)
  music_albums.select do |album|
    puts "Genre: #{album['genre']}, Author: #{album['author']}, publish date: #{album['publish_date']}" if album.instance_of?(Hash)
    puts "Genre: #{album.genre}, Author: #{album.author}, publish_date: #{album.publish_date}" if album.instance_of?(MusicAlbum)
  end
end

def display_genres_on_list_all_genres(genres)
  genres.each do |genre|
    puts "Name: #{genre['name']}" if genre.instance_of?(Hash)
    puts "Name: #{genre.name}" if genre.instance_of?(Genre)
  end
end

def display_genres_on_add_music_album(genres)
  genres.each_with_index do |genre, i|
    puts "#{i}) Name: #{genre['name']}" if genre.instance_of?(Hash)
    puts "#{i}) Name: #{genre.name}" if book.instance_of?(Book)
  end
end