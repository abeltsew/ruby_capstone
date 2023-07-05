require 'json'
require_relative '../music'
require_relative '../genre'

def preserve_data
  music_data = []
  genre_data = []

  @music.each do |album|
    music_data << { 'id' => album.id,
                    'publish_date' => album.publish_date,
                    'on_spotify' => album.on_spotify }
  end

  File.write('db/music.json', JSON.pretty_generate(music_data))
  # end of music
  @genres.each do |genre|
    genre_data << { 'name' => genre.name }
  end

  File.write('db/genre.json', JSON.pretty_generate(genre_data))
end

def saved_albums
  music_data = [].to_json
  genre_data = [].to_json

  music_data = File.read('db/music.json') if File.exist?('db/music.json')

  genre_data = File.read('db/genre.json') if File.exist?('db/genre.json')
  music = JSON.parse(music_data)
  genres = JSON.parse(genre_data)

  music.each do |album|
    @music << MusicAlbum.new(album['on_spotify'], album['publish_date'])
  end

  genres.each do |genre|
    @genres << Genre.new(genre['name'])
  end
end

def add_music
  print 'Enter Album genre: '
  name = gets.chomp

  print 'Enter Published Date: '
  p_date = gets.chomp

  print 'On spotify [Y/N]: '
  on_spotify = gets.chomp.downcase == 'y'

  music = MusicAlbum.new(on_spotify, p_date)
  @music << music

  genre = Genre.new(name)
  genre.add_item(music)
  @genres << genre
  preserve_data
  puts 'Music album created successfully '
end

def musics_list
  @music.each do |album|
    puts '------------------------------'
    puts "published on: #{album.publish_date}"
    puts "On Spotify: #{album.on_spotify} "
  end
end

def genre_lists
  puts 'Genres'
  puts '------'
  @genres.each { |genre| puts genre.name }
end

def manage_music
  puts 'Enter the number corresponding to your choice:'
  puts '1 - List all Music Albums'
  puts '2 - List genres'
  puts '3 - Add Music Album'
  puts '4 - Back'
  users_election = gets.chomp.to_i
  case users_election
  when 1
    return puts 'No music album available, try adding one!' if @music.empty?

    musics_list
  when 2
    return puts 'No Music Genres available, try adding album!' if @genres.empty?

    genre_lists
  when 3
    add_music
  when 4
    nil
  end
end
