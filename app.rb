require_relative './app-management/UI'

class App
  ui = UI.new
  ui.welcome
  loop do
    ui.options
    option = gets.chomp
  end

  def exit_app
    puts 'Exiting the application....' 
    puts 'Goodbye!'
    exit
  end

end