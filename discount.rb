class Discount
	def applicable?(books)
  		books.count == books.uniq.count && books.count >= MIN_BOOKS_FOR_DISCOUNT
	end

	def calculate_price(books)
  		discounts = [0.95, 0.90, 0.80, 0.75]
  		BOOK_PRICE * books * discounts[books - 2]
	end
end