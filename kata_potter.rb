# Kata Potter
require_relative "./basket.rb"

def basket(books)
  basket = Basket.new
  price_calculator = PriceCalculator.new
   basket.generate_all_available(books).map{|basket|
      price_calculator.min_price(basket) 
   }.min
end