require 'json'

class StoreData
  def initialize(file_path)
    @file_path = file_path
  end

  def store(data)
    existing_data = []

    begin
      existing_data = JSON.parse(File.read(@file_path)) if File.exist?(@file_path)

      combined_data = existing_data + data

      File.write(@file_path, JSON.pretty_generate(combined_data))

      puts "📝 Data saved to #{@file_path}!"
    rescue StandardError => e
      puts "🚨 An error occurred while saving the data: #{e.message}"
    end
  end
end