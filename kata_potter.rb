# Kata Potter

# Magic Number
BOOK_PRICE = 8
MIN_BOOKS_FOR_DISCOUNT = 2

def calculate_discount_price(books)
  discounts = [0.95, 0.90, 0.80, 0.75]
  BOOK_PRICE * books * discounts[books - 2]
end

def discount_applicable?(books)
  books.count == books.uniq.count && books.count >= MIN_BOOKS_FOR_DISCOUNT
end

def basket_split(books, size)
  [books.first(size), books.last(books.count - size)]
end

def calculate_partial_total(books)
    return  calculate_discount_price(books.count) if discount_applicable?(books)
    books.count * BOOK_PRICE
end

def calculate_min_price(group)
  (0..group.length).map{|size|
    basket_split(group, size).map{|books_splited|
      calculate_partial_total(books_splited) 
    }.reduce(:+)
  }.min    
end

def generate_all_available_baskets(books)
  books.permutation.to_a.uniq
end

def basket(books)
   generate_all_available_baskets(books).map{|basket|
      calculate_min_price(basket) 
   }.min
end