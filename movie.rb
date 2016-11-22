class Movie < Product

  def initialize(title, director_name, year, price, amount)
    super(price, amount)
    @title = title
    @director_name = director_name
    @year = year

  end

  def info
    "#{@title}, режиссёр #{@director_name}, год #{@year}"
  end
end