require_relative '../book'
require_relative '../label'

describe Label do
  it('should create a Label') do
    label = Label.new('Book Title', 'red')

    expect(label.color).to eq('red')
  end

  it('should add items to the Iitem object') do
    book = Book.new('Author', ' Bad', '10-10-2019')

    label = Label.new('title', 'blue')

    label.add_item(book)

    expect(label.color).to eq('blue')
    expect(book.label.title).to eq('title')
  end
end
