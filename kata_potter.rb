# Kata Potter
require_relative "./basket.rb"

# Magic Number
BOOK_PRICE = 8
MIN_BOOKS_FOR_DISCOUNT = 2

def basket(books)
  basket = Basket.new
  price_calculator = PriceCalculator.new
   basket.generate_all_available_baskets(books).map{|basket|
      price_calculator.min_price(basket) 
   }.min
end