#!/usr/bin/env ruby

require 'json'
require_relative './game'
require_relative '../modules/add_items'
require_relative '../modules/list_items'
require_relative './database'
class Main
  include CreateItems
  def initialize
    load_data
    @database = Database.new
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
    loop do
      puts "\n Enter a number"
      sleep 1

      @list.each do |key, value|
        puts "#{key} - #{value}"
      end
      user_input = gets.chomp.to_i
      input(user_input)
      break if user_input == 13
    end
  end

  def input(inp)
    if inp != 13
      list_books if inp == 1
      list_albums if inp == 2
      list_all_movies if inp == 3
      list_all_games if inp == 4
      list_genres if inp == 5
      list_labels if inp == 6
      list_all_authors if inp == 7
      list_all_sources if inp == 8
      add_book if inp == 9
      add_music_album if inp == 10
      add_a_movie if inp == 11
      add_a_game if inp == 12
      puts 'Please enter a valid number between 1 and 13!' unless (1..12).include?(inp)
      sleep 2
    end
  end

  private

  def load_games
    path = '../saving_files/game.json'
    if File.exist?(path)
      print('exist')
      contenu = JSON.parse(File.read(path))
      contenu.each do |game|
        Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
      end
    end
  end

  def load_data
    load_games
  end
end

def app
  application = Main.new
  application.run
end

app
