require 'date'

class Item
    attr_accessor :genre
    attr_accessor :author
    attr_accessor :source
    attr_accessor :label
    attr_accessor :publish_date

    def initialize(id, genre, author, source, label, publish_date: Date.today, archived: false)
        @id = id
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date.strftime('%Y-%m-%d')
        @archived = archived
    end
    
    def move_to_archive
        
    end
    
    private
    def can_be_archived?
        
    end
end

item = Item.new(1, 'Sci-Fi', 'Jack' , 'Local library', 'B1', publish_date: Date.new(2023, 8, 12), archived: true )
p item.genre
p item.author
p item.source
p item.label
p item.publish_date