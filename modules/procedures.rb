def music_album_genre(genre, music_album)
  music_album.genre = if genre.instance_of?(Genre)
                  genre
                else
                  Genre.new(genre['name'])
                end
end