require_relative "./basket.rb"
require_relative "./discount.rb"

class PriceCalculator
	def partial_total(books)
		discount = Discount.new
    	return  discount.calculate_discount_price(books.count) if discount.discount_applicable?(books)
    	books.count * BOOK_PRICE
	end

	def min_price(group)
  		basket = Basket.new
  		(0..group.length).map{|size|
    		basket.split(group, size).map{|books_splited|
      		partial_total(books_splited) 
    		}.reduce(:+)
  		}.min    
	end
end