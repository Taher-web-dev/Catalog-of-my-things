require_relative '../classes/book'
require_relative './list_items'
require_relative './module'
require_relative '../classes/label'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/music_album'

module CreateItems
  include AppFcts
  include ListItems

  def add_book
    label = create_label
    puts 'Enter The Publish Date? (dd-mm-yyyy)'
    publish_date = gets.chomp
    p publish_date
    puts "\Enter the publisher of the book?"
    publisher = gets.chomp
    puts 'Enter the state of the cover? (bad or good)'
    cover_state = gets.chomp
    newbook = Book.new(publisher, publish_date, cover_state)
    newbook.add_author(Author.new('first_name', 'last_name'))
    bookdata = { publisher: newbook.publisher, cover_state: newbook.cover_state,
                 publish_date: newbook.publish_date, label: label.title }
    @database.save(bookdata, 'books')
    puts 'book created successfully!'
  end

  def create_label
    puts "Select a label from the following list or type 'a' to add a new label:"
    labels_list = @database.get_data_from('../saving_files/labels')
    show_labels(labels_list)
    option_selected = gets.chomp
    if option_selected == 'a'
      puts 'Please Enter the title of the label'
      title = gets.chomp
      puts 'Please Enter the color of the label'
      color = gets.chomp
      newlabel = { title: title, color: color, items: [] }
      @database.save(newlabel, 'labels')
      Label.new(title, color)
    else
      Label.new(labels_list[option_selected.to_i]['title'], labels_list[option_selected.to_i]['color'])
    end
  end

  def add_music_album
    puts " Select a Genre from the list bellow. If the Genre is not in the list type 'c' to create a new one."
    genre_return = create_genres
    puts 'Enter the name of the album'
    name = gets.chomp
    puts 'Enter the publish date of the album?(dd-mm-yyyy) '
    date = gets.chomp
    puts "\n  Is the album on Spotify?"
    puts '1 - Yes'
    puts '2 - No'
    spotify = gets.chomp.to_i
    MusicAlbum.new(spotify == 1, name, date)
    newalbum = { publish_date: date, on_spotify: spotify == 1, genre: genre_return.name }
    @database.save(newalbum, 'albums')
  end

  def create_genres
    list_genres
    option = gets.chomp
    genres_list = @database.get_data_from('genres')
    if option == 'c'
      puts 'Enter the Genre name: '
      genre_name = gets.chomp
      genredata = { name: genre_name }
      @database.save(genredata, 'genres')
      Genre.new(genre_name)

    else
      Genre.new(genres_list[option.to_i]['name'])
    end
  end
end
