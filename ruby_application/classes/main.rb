#!/usr/bin/env ruby
require 'json'
require_relative './module'
require './classes/game'
class Main
  include AppFcts
  def initialize
    load_data
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

  def load_games
    path = './saving_files/game.json'
    if File.exist?(path)
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
