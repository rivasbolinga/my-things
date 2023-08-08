class List
  def books(list)
    puts 'No books' if list.empty?
    list.each do |book|
      puts "- Publisher: \"#{book.publisher}\", Publish Date: #{book.publish_date}"
    end
  end

  def labels(list)
    puts 'No Labels' if list.empty?
    list.each do |label|
      puts "- Title: \"#{label.title}\", Color: #{label.color}"
    end
  end
end
