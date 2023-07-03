require_relative 'lib/manage_books'
require_relative 'lib/manage_music'
require_relative 'lib/manage_games'

class App
  attr_accessor :books, :music, :games

  def initialize
    @books = []
    @music = []
    @games = []
    @labels = []
  end

  def load_data
    puts 'Loading data here..'
  end

  def save_exit
    puts 'Goodbye'

    # save_books

    # save_music

    # save_games

    exit
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'Please enter the number for the task you want to perform'
    puts 'choose one of the following'
    puts '1 - Manage books.'
    puts '2 - Manage Music.'
    puts '3 - Manage Games.'
    puts '4 - Exit'
  end
end
