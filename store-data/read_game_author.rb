require 'json'

class ReadData
  def initialize(file_path)
    @file_path = file_path
  end

  def read_data
    data = []

    File.open(@file_path, 'r') do |file|
      data = JSON.parse(file.read)
    end
  end
end
