class Music < Product

  def initialize(album_name,artist_name, genre, price, amount)
    super(price, amount)
    @album_name = album_name
    @artist_name = artist_name
    @genre = genre
  end

  def info
    "#{@album_name}, #{@artist_name}, жанр #{@genre} "
  end

end