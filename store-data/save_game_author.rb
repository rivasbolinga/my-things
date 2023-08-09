require 'json'

class StoreData
  def initialize(file_path)
    @file_path = file_path
  end

  def store(data)
    File.write(@file_path, JSON.pretty_generate(data))

    puts "📝 Data saved to #{@file_path}!"
  rescue StandardError => e
    puts "🚨 An error occurred while saving the data: #{e.message}"
  end
end
