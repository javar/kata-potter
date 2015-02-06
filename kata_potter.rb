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
  partial_total = 0
  if discount_applicable?(books)
    partial_total += calculate_discount_price(books.count)
  else  
    partial_total += books.count * BOOK_PRICE
  end
end

def basket(books)
   result = books.permutation.map{|element|
      (0..element.length).map{|size|
        basket_split(element, size).map{|books_splited|
         calculate_partial_total(books_splited) 
        }.reduce(:+)
      }.min    
   }.min
  result
end