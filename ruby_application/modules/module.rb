require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../classes/book'
module AppFcts
  def list_all_books; end

  def list_all_musicalbums
    puts 'ok'
  end

  def list_all_movies
    puts 'ok'
  end

  def list_all_games
    games = Game::ALL_GAMES.all_games
    if games.size.positive?
      games.each do |game|
        puts "[GAME] ID:#{game.id}, Publish Date:#{game.publish_date}, Last played at:#{game.last_played_at}"
      end
    else
      puts 'No games to display...'
    end
    sleep 2
  end

  def list_all_genres
    puts 'ok'
  end

  def list_all_labels
    puts 'ok'
  end

  def list_all_authors
    authors = Author::ALL_AUTHORS.all_authors
    if authors.size.positive?
      authors.each do |author|
        puts "ID:#{author.id}, Name:#{author.first_name} #{author.last_name}"
      end
    else
      puts 'No authors to display...'
    end
    sleep 2
  end

  def list_all_sources
    puts 'ok'
  end

  def add_a_musicalbum
    puts 'ok'
  end

  def add_a_movie
    puts 'ok'
  end

  def add_a_game
    print 'publish_date:  '
    publish_date = gets.chomp
    publish_date = control_date publish_date, 'publish_date:  '
    print 'multiplayer: '
    multiplayer = gets.chomp
    print 'last_played_at: '
    last_played_at = gets.chomp
    last_played_at = control_date last_played_at, 'last_played_at: '
    Game.new(publish_date, multiplayer, last_played_at)
    new_contenu = { publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at }
    path_file = '../saving_files/game.json'
    if File.exist?(path_file)
      contenu = JSON.parse(File.read(path_file))
      contenu.push(new_contenu)
      File.write(path_file, JSON.generate(contenu))
    else
      File.write(path_file, JSON.generate([new_contenu]))
    end
    puts 'Game created successfuly'
    sleep 2
  end

  private

  def control_date(entry_date, text)
    until entry_date.match(/^\d{1,2}-\d{1,2}-\d{2}(\d{2})*$/)
      puts 'Please enter a date in this format **-**-****'
      print text
      entry_date = gets.chomp
    end
    entry_date
  end
end
