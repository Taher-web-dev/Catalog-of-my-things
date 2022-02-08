module App_fcts
    def input(inp)
        if inp != 13
          case inp
          when 1 
            list_all_books
          when 2 
            list_all_musicalbums
          when 3 
            list_all_movies
          when 4 
            list_all_games
          when 5 
            list_all_genres
          when 6 
            list_all_labels
          when 7 
            list_all_authors
          when 8 
            list_all_sources
          when 9 
            add_book
          when 10 
            add_a_musicalbum
          when 11 
            add_a_movie
          when 12 
            add_a_game
          else
            puts 'Please enter a valid number between 1 and 13!'
            sleep 2
          end
        end
      end
    
      def list_all_books
        puts "ok"
      end
    
      def list_all_musicalbums
        puts "ok"
      end
    
      def list_all_movies
        puts "ok"
      end
    
      def list_all_games
        puts "ok"
      end
      def list_all_genres
        puts "ok"
      end 
      def list_all_labels
        puts "ok"
      end
      def list_all_authors
        puts "ok"
      end
      def list_all_sources
        puts "ok"
      end
      def add_book
        puts "ok"
      end
      def add_a_musicalbum
        puts "ok"
      end
      def add_a_movie
        puts "ok"
      end
      def add_a_game
        print "publish_date:  "
        publish_date = gets.chomp
        while !publish_date.match(%r{^\d{1,2}-\d{1,2}-\d{2}(\d{2})*$})
          puts 'Please enter a valid date in this format **-**-****'
          print 'publish_date: '
          publish_date = gets.chomp
        end
        print "multiplayer: "
        multiplayer = gets.chomp
        print 'last_played_at: '
        last_played_at = gets.chomp
        while !last_played_at.match(%r{^\d{1,2}-\d{1,2}-\d{2}(\d{2})*$})
          puts 'Please enter a valid last played date in this format **-**-****'
          print 'last_played_at'
          last_played_at = gets.chomp
        end
        game = Game.new(publish_date, multiplayer, last_played_at)
        new_contenu = { publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at }
        path_file = './saving_files/game.json'
        if File.exist?(path_file)
          contenu = JSON.parse(File.read(path_file))
          contenu.push(new_contenu)
          File.write(path_file,JSON.generate(contenu))
        else
          File.write(path_file, JSON.generate([new_contenu]))
        end
        puts 'Game created successfuly'
        sleep 2
      end
end