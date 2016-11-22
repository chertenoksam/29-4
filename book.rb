class Book < Product

  def initialize(title, author_name, price, amount)
    super(price, amount)
    @title = title
    @author_name = author_name
  end

  def info
    "#{@title}, автор #{@author_name}"
  end

end