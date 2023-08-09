require_relative 'app-management/ui_class'
require './app-management/list'
require './app-management/create'
require './store-data/save'
require './store-data/open'
require './app-management/create_game'
require './app-management/list_game'
require './app-management/list_authors'
class App
  def initialize
    @ui = UI.new
    @list = List.new
    @create = Create.new
    @save = Save.new
    @open = Open.new
    @books_and_labels = @open.books
    @add_game = CreateGame.new
    @list_game = ListGame.new
    @list_all_authors = ListAuthors.new
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
    @list_game.list_games
  end

  def list_all_genres
    puts 'You have selected 4 - List all genres'
  end

  def list_all_labels
    @list.labels(@books_and_labels[:labels_list])
  end

  def list_all_authors
    puts 'You have selected 6 - List all authors'
    @list_all_authors.list_authors
  end

  def create_book
    @books_and_labels = @create.new_book(@books_and_labels)
  end

  def create_music_album
    puts 'You have selected 8 - Create a music album'
  end

  def create_game
    puts 'You have selected 9 - Create a game'
    @add_game.create_game
  end

  def exit_app
    @save.books(@books_and_labels[:books_list])
    puts 'Exiting the application....'
    puts 'Goodbye!👋🏼'
    exit
  end
end
