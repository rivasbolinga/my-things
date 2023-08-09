def music_album_select_genre(ans, genres, stored_genres)
  if ans != '0' && ans.to_i.zero? # if the user provide a new genre name
    selected_genre = Genre.new(ans)
    genres << selected_genre # push the new created genre to the @genre array
    selected_genre
  else
    (stored_genres + genres)[ans.to_i] # if the user select a genre from the list
  end
end

def music_album_genre(genre, music_album)
  music_album.genre = if genre.instance_of?(Genre)
                        genre
                      else
                        Genre.new(genre['name'])
                      end
end

def instanciate_a_music_album(publish_date, on_spotify)
  if publish_date && on_spotify
    MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
  elsif publish_date && !on_spotify
    MusicAlbum.new(publish_date: publish_date)
  elsif !publish_date && on_spotify
    MusicAlbum.new(on_spotify: on_spotify)
  else
    MusicAlbum.new
  end
end
