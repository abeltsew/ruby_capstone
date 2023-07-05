require 'json'

require_relative '../book'
require_relative '../label'

def fetch_data(file)
  if File.exist?("db/#{file}.json")
    File.read("db/#{file}.json")
  else
    empty_json = [].to_json
    File.write("db/#{file}.json", empty_json)
    empty_json
  end
end

def load_books
  books = JSON.parse(fetch_data('books'))
  labels = JSON.parse(fetch_data('labels'))

  books.each do |book|
    @books << Book.new(book['publisher'], book['cover_state'], book['published_at'])
  end

  labels.each do |label|
    @labels << Label.new(label['title'], label['color'])
  end
end

def save_book
  updated_books = []

  # book = Book.new(publisher, cover_state, published_at)
  @books.each do |book|
    updated_books << { 'id' => book.id,
                       'publisher' => book.publisher,
                       'cover_state' => book.cover_state,
                       'published_at' => book.publish_date }
  end

  File.write('db/books.json', JSON.pretty_generate(updated_books))
end

def save_label
  updated_labels = []

  # book = Book.new(publisher, cover_state, published_at)
  @labels.each do |label|
    updated_labels << { 'title' => label.title,
                        'color' => label.color }
  end

  File.write('db/labels.json', JSON.pretty_generate(updated_labels))
end

def add_book
  puts 'Enter the name of the Book'
  title = gets.chomp

  puts 'Enter the color of the Book'
  color = gets.chomp

  puts 'Enter book Publisher'
  publisher = gets.chomp

  puts 'Enter book cover state (new/bad)'
  cover_state = gets.chomp.downcase

  puts 'Enter Published Date:'
  published_at = gets.chomp

  book = Book.new(publisher, cover_state, published_at)
  @books << book

  label = Label.new(title, color)
  label.add_item(book)

  @labels << label

  save_book

  save_label

  puts 'Book created Successfully!'
end

def list_books
  @books.each do |book|
    puts '------------------------------'
    puts "Publisher: #{book.publisher} "
    puts "Cover Status: #{book.cover_state} "
    puts "published on: #{book.publish_date}"
    puts '------------------------------'
  end
end

def list_labels
  @labels.each { |label| puts "Title: #{label.title} color: #{label.color}" }
end

def manage_books
  puts 'Choose your action for your books'

  puts '1. List all books'
  puts '2. List all labels (e.g. Gift, New)'
  puts '3. Add Book'
  puts '4. return'

  choice = gets.chomp.to_i

  case choice
  when 1
    return puts 'There are No Books in the collection yet!' if @books.empty?

    list_books
  when 2
    return puts 'There are No labels in the collection yet!' if @labels.empty?

    list_labels
  when 3
    add_book
  when 4
    nil
  end
end
