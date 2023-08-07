require_relative 'app-management/ui_class'
require './list'

class App
  def initialize
    @ui = UI.new
    @books_and_labels = {
      books_list: [],
      labels_list: []
    }
    @list = List.new
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
      8 => method(:create_music_album),
      9 => method(:create_game),
      10 => method(:exit_app)
    }

    action = actions[option]
    if action
      action.call
    else
      puts '❌ Sorry! You have to select one of the options'
    end
  end

  def list_all_books
    @list.books(@books_and_labels[:books_list])
  end

  def list_all_music_albums
    puts 'You have selected 2 - List all music albums'
  end

  def list_all_games
    puts 'You have selected 3 - List all games'
  end

  def list_all_genres
    puts 'You have selected 4 - List all genres'
  end

  def list_all_labels
    @list.labels(@books_and_labels[:labels_list])
  end

  def list_all_authors
    puts 'You have selected 6 - List all authors'
  end

  def create_book
    puts 'You have selected 7 - Create a book'
  end

  def create_music_album
    puts 'You have selected 8 - Create a music album'
  end

  def create_game
    puts 'You have selected 9 - Create a game'
  end

  def exit_app
    puts 'Exiting the application....'
    puts 'Goodbye!👋🏼'
    exit
  end
end
