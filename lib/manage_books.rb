require_relative '../book'

def manage_books
  puts 'Choose your action for your books'

  puts '1. List all books'
  puts '2. List all labels (e.g. Gift, New)'
  puts '3. Add Book'
  puts '4. return'

  choice = gets.chomp.to_i

  case choice
  when 1
    return puts 'There are No Books in collection yet!' if @books.empty?

    @books.each do |book|
      puts '------------------------------'
      puts "Publisher: #{book.publisher} "
      puts "Cover Status: #{book.cover_state} "
      puts "published on: #{book.publish_date}"
      puts '------------------------------'
    end
  when 2
    puts 'label here'
  when 3
    puts 'Enter book Publisher'
    publisher = gets.chomp

    puts 'Enter book cover state (new/bad)'
    cover_state = gets.chomp.downcase

    puts 'Enter Published Date:'
    published_at = gets.chomp

    @books << Book.new(publisher, cover_state, published_at)
  when 4
    nil
  end
end
