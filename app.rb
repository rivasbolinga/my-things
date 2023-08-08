require_relative 'app-management/ui_class'
require './music_album.rb'
require './genre.rb'
require_relative 'modules/read_data_files.rb'
require_relative 'modules/display.rb'
require 'json'

class App
  def initialize
    @ui = UI.new
    @music_albums = []
    @stored_music_albums = read_music_albums_json()
    @stored_genres = 
    @genres = []
  end

  def run
    @ui.welcome
    loop do
      @ui.options
      option = gets.chomp
      break if option.downcase == 'exit'

      apply_option(option.to_i)
    end
    exit_app
  end

  # To be completed later on ↓
  def apply_option(option)
    actions = {
      1 => method(:list_all_books),
      2 => method(:list_all_music_albums),
      3 => method(:list_all_games),
      4 => method(:list_all_genres),
      5 => method(:list_all_labels),
      6 => method(:list_all_authors),
      7 => method(:create_book),
      8 => method(:add_genre),
      9 => method(:add_music_album),
      10 => method(:create_game),
      11 => method(:exit_app)
    }

    action = actions[option]
    if action
      action.call
    else
      puts '❌ Sorry! You have to select one of the options'
    end
  end

  def list_all_books
    puts 'You have selected 1 - List all books'
  end

  def list_all_music_albums
    available_music_albums = @stored_music_albums + @music_albums
    display_music_albums_on_list_all_music_album(available_music_albums)
  end

  def list_all_games
    puts 'You have selected 3 - List all games'
  end

  def list_all_genres
    books.each_with_index do |book, i|
      puts "#{i}) Title: \"#{book['title']}\", Author: #{book['author']}" if book.instance_of?(Hash)
      puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" if book.instance_of?(Book)
    end
  end

  def list_all_labels
    puts 'You have selected 5 - List all labels'
  end

  def list_all_authors
    puts 'You have selected 6 - List all authors'
  end

  def create_book
    puts 'You have selected 7 - Create a book'
  end

  def add_genre
    print 'name: '
    @genres << Genre.new(gets.chomp)
  end

  def add_music_album
    print 'publish_date [YYYY/MM/DD]: '
    ans = gets.chomp
    pattern = /\A\d{4}\/\d{2}\/\d{2}\z/
    # ans should not be empty and meet YYYY/MM/DD format
    publish_date = Date.parse(ans) if !ans.empty? && pattern.match(ans)

    print 'On spotify? [Y/N]: '
    ans = gets.chomp
    on_spotify = true if ans.downcase == 'y'|| ans.upcase == 'Y'
    on_spotify = false if ans.downcase == 'n'|| ans.upcase == 'N'

    if publish_date
      music_album = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    else
      music_album = MusicAlbum.new(on_spotify: on_spotify)
    end
    @music_albums << music_album
  end

  def create_game
    puts 'You have selected 9 - Create a game'
  end

  def exit_app
    @stored_music_albums += @music_albums
    File.write('music_albums.json', JSON.generate(@stored_music_albums).to_s)
    puts 'Exiting the application....'
    puts 'Goodbye!👋🏼'
    exit
  end
end