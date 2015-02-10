require_relative "./price_calculator.rb"

class Basket
	def generate_all_available_baskets(books)
  		books.permutation.to_a.uniq
	end

	def split(books, size)
  		[books.first(size), books.last(books.count - size)]
	end
end