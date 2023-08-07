require_relative './app-management/ui_class'

class App
  def initialize
    @ui = UI.new
  end
  
 def run
    @ui.welcome
    loop do
      @ui.options
      option = gets.chomp.to_i
      apply_option(option)
    end
  end

  #To be completed later on ↓
  def apply_option(option)
    case option
    when 1
      puts 'You have selected 1 - List all books'
    when 2
      puts 'You have selected 2 - List all music albums'
    when 3
      puts 'You have selected 3 - List all games'
    when 4
      puts 'You have selected 4 - List all genres'
    when 5
      puts 'You have selected 5 - List all labels'
    when 6
      puts 'You have selected 6 - List all authors'
    when 7
      puts 'You have selected 7 - Create a book'
    when 8
      puts 'You have selected 8 - Create a music album'
    when 9
      puts 'You have selected 9 - Create a game'
    when 10
      exit_app
    else 
      puts 'Sorry! You have to select one of the options'
    end
  end

  def exit_app
    puts 'Exiting the application....' 
    puts 'Goodbye!'
    exit
  end

end