
require_relative '../classes/database'

module ListItems

  def list_books
    books = @database.get_data_from('books')
    if books.empty?
      puts "\n book List is empty."
    else
      books.each do |book|
        print "\n Published: #{book['publish_date']}, Publisher: #{book['publisher']}, State:#{book['cover_state']}"
      end
    end
  end
    
    def show_labels(list)
        if list.empty?
          puts "\nThere are no labels."
        else
          puts "\nLabels:"
          list.each_with_index { |label, i| puts "#{i} - #{label['title']}" }
        end
      end

      def list_genres
        list = @database.get_data_from('../saving_files/genres')
        if list.empty?
          puts "\nThere are no genres."
        else
          puts "\nGenres:\n\n"
          list.each_with_index { |genre, index| puts "#{index} - #{genre['name']}" }
        end
      end

      def list_labels
        labels_list = @database.get_data_from('labels')
        if labels_list.empty?
          puts "\n Labels List is empty."
        else
          labels_list.each { |item| puts "\n Title: #{item['title']}, Color: #{item['color']}" }
        end
      end

      
  def list_albums
    albums_list = @database.get_data_from('albums')
    if albums_list.empty?
      puts "\n Albums list is empty."
    else
      albums_list.each do |album|
        puts "\nPublished in: #{album['publish_date']}, on Spotify: #{album['on_spotify']}, Genre: #{album['genre']}"
      end
    end
  end
end