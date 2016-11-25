#xml
require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'book.rb'
require_relative 'music.rb'

require "rexml/document"
require "date"

current_path = File.dirname(__FIle__)
file_name = current_path + "data/products.xml"

abort "Извините, но файл с товарами не найден!" unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML :: Document.new(file)

products = Hash.new

doc.elements.each("books/book") do |item|
  title = item.attributes["title"]
  author_name = item.attributes["author_name"]
  price = item.attributes["price"].to_s
  amount = item.attributes["amount"].to_s

  product = Book.new(title, author_name, price, amount)
  products[title] = product

end

doc.elements.each("movies/movie") do |item|
  title = item.attributes["title"]
  director_name = item.attributes["director_name"]
  price = item.attributes["price"].to_s
  amount = item.attributes["amount"].to_s
  year = item.attributes["year"].to_s

  product = Movie.new(title, director_name, price, amount, year)
  products[title] = product
end

doc.elements.each("music_disks/music") do |item|
  album_name = item.attributes["album_name"]
  artist_name = item.attributes["artist_name"]
  price = item.attributes["price"].to_s
  amount = item.attributes["amount"].to_s
  genre = item.attributes["genre"]

  product = Music.new(album_name, artist_name, genre, price, amount)
  products[title] = product
end

file.close



