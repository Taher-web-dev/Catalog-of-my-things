class Main
  def initialize
    @list = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List all games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all sources',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '13' => 'Exit'
    }
  end

  def run
    puts 'Please Enter a number'
    loop do
      @list.each do |key, value|
        puts "#{key} - #{value}"
      end
      user_input = gets.chomp.to_i
      input(user_input)
      break if user_input == 13

      input
    end
  end
end

def input(input)
  case input
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
  when 13
  else puts 'Enter a valid number'
  end
end

def app
  app = Main.new
  app.run
end

app
