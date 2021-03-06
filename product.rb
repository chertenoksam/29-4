#Напишите у класса продукта статический метод showcase, который принимает на вход
# массив продуктов, проходится по ним и выводит каждый из них методом show.
# Рядом с каждым продуктом нужно вывести его порядковый номер, чтобы пользователь
# мог выбрать его. Не забывайте, что статические методы определяются с помощью
# ключевого слова self:
#def self.showcase(products)
#  ...
#end

#После этого напишите для товара метод покупки buy: он проверяет, остался ли
# товар на складе (@amount_available должно быть больше нуля) и если остался —
# пишет об удачной покупке, уменьшает количество на складе на 1 и возвращает
# стоимость товара. А если не осталось — пишет об этом и возвращает 0.

class Product

  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def get_price
    @price
  end


#абстрактный метод, который хранит информацию о продукте
  def info
  end

  def show
    "#{info}, продукт стоит #{@price} рублей. Осталось: #{@amount}"
  end

  def self.showcase(products)
    count = 0
    while count <= products.length
      product = products[count]
      puts "#{count}. #{product.show}"
      count += 1
    end
  end

#После этого напишите для товара метод покупки buy: он проверяет, остался ли
# товар на складе (@amount_available должно быть больше нуля) и если остался —
# пишет об удачной покупке, уменьшает количество на складе на 1 и возвращает
# стоимость товара. А если не осталось — пишет об этом и возвращает 0.

  def buy
    if @amount > 0
      puts "Товар есть в наличии. Вы записаны на доставку."
      @amount -= 1
      return @price
    else
      puts "Данного товара нет в наличии."
      return 0
    end
  end
end