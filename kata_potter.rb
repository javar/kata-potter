# Kata Potter
require_relative "./basket.rb"

def basket(books)
  basket = Basket.new
  basket.generate_all_available(books).map{|basket| basket_price(basket)}.min
end

def basket_price (basket)
  price_calculator = PriceCalculator.new
  price_calculator.min_price(basket)
end
