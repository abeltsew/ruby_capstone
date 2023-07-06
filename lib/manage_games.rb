require_relative '../game'
require_relative '../author'
require 'json'

def game_options
  puts 'Please enter the number of the option to proceed'
  puts '1. List all games'
  puts '2. List all authors'
  puts '3. List all labels'
  puts '4. List all geners'
  puts '5. Add a game'
  puts '6. return'
  print '>>> :'
end

def manage_games
  puts
  game_options
  option = gets.chomp.to_i
  case option
  when 1
    list_all_games
  when 2
    list_all_authors
  when 3
    list_labels
  when 4
    genre_lists
  when 5
    add_game
  when 6
    nil
  else
    puts 'Invalid option, please enter the number (eg. "1")'
  end
end

def add_game
  puts
  print 'Enter author first name: '
  first_name = gets.chomp
  print 'Enter author last name: '
  last_name = gets.chomp
  print 'Is the game multiplayer? (Y/N): '
  is_multiplayer = gets.chomp.downcase == 'y'
  print 'Enter last played date (DD/MM/YYYY): '
  last_played_at = gets.chomp
  print 'Enter date of publish (DD/MM/YYYY): '
  publish_date = gets.chomp

  game = Game.new(last_played_at, publish_date, multiplayer: is_multiplayer)
  @games << game
  author = Author.new(first_name, last_name)
  @authors << author
  author.add_item(game)
  puts "\nGame created successfully!"

  save_authors
  save_games
end

def list_all_games
  puts
  return puts 'No games found!' if @games.empty?

  @games.each do |game|
    puts '------------------------------------------------------------'
    puts "Last Played date: #{game.last_played_at}"
    puts "Game published date: #{game.publish_date}"
    puts '------------------------------------------------------------'
  end
end

def list_all_authors
  puts
  return puts 'No authors found!' if @authors.empty?

  puts '------------------------------------------------------------'
  @authors.each_with_index do |author, index|
    puts "Author #{index + 1}: #{author.first_name} #{author.last_name}"
  end
  puts '------------------------------------------------------------'
end

def save_authors
  json = []
  @authors.each do |author|
    json << author.to_json
  end
  File.write('db/authors.json', JSON.pretty_generate(json))
end

def save_games
  json = []
  @games.each do |game|
    json << game.to_json
  end
  File.write('db/games.json', JSON.pretty_generate(json))
end

def load_authors
  return unless File.exist?('db/authors.json')
  return if File.empty?('db/authors.json')

  authors = JSON.parse(File.read('db/authors.json'))
  authors.each do |author|
    @authors << Author.new(author['first_name'], author['last_name'])
  end
end

def load_games
  return unless File.exist?('db/games.json')
  return if File.empty?('db/games.json')

  games = JSON.parse(File.read('db/games.json'))
  games.each do |game|
    @games << Game.new(game['last_played_at'], game['publish_date'], multiplayer: game['multiplayer'])
  end
end

def load_game_data
  load_authors
  load_games
end
