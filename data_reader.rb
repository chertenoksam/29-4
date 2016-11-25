#xml
require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'book.rb'
require_relative 'music.rb'

require "rexml/document"
require "date"

def read_products
  current_path = File.dirname(__FILE__)
  file_name = current_path + "/data/products.xml"

  abort "Извините, но файл с товарами не найден!" unless File.exist?(file_name)

  file = File.new(file_name)

  doc = REXML::Document.new(file)

  products = Hash.new

  doc.elements.each("products/books/book") do |item|
    title = item.attributes["title"]
    author = item.attributes["author"]
    price = item.attributes["price"].to_s
    amount = item.attributes["amount"].to_s

    product = Book.new(title, author, price, amount)
    products[title] = product

  end

  doc.elements.each("products/movies/movie") do |item|
    title = item.attributes["title"]
    author = item.attributes["author"]
    price = item.attributes["price"].to_s
    amount = item.attributes["amount"].to_s
    year = item.attributes["year"].to_s

    product = Movie.new(title, author, price, amount, year)
    products[title] = product
  end

  doc.elements.each("products/music_disks/music") do |item|
    title = item.attributes["title"]
    author = item.attributes["author"]
    price = item.attributes["price"].to_s
    amount = item.attributes["amount"].to_s
    genre = item.attributes["genre"]

    product = Music.new(title, author, genre, price, amount)
    products[title] = product
  end

  file.close

  return products

end

