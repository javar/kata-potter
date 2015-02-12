require_relative "./basket.rb"
require_relative "./discount.rb"

BOOK_PRICE = 8
MIN_BOOKS_FOR_DISCOUNT = 2

class PriceCalculator
	def partial_total(books)
		discount = Discount.new
    	return  discount.calculate_price(books.count) if discount.applicable?(books)
    	books.count * BOOK_PRICE
	end

  def sum_splited(group, size)
    basket = Basket.new
    basket.split(group, size).map{|books_splited|
      partial_total(books_splited) 
    }.reduce(:+)
  end

	def min_price(group)
  		(0..group.length).map{|size|
    		sum_splited(group, size)
  		}.min    
	end
end