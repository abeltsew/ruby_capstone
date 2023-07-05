require_relative '../music'
require_relative '../genre'

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
