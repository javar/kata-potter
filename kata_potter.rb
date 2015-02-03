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

def basket(books)
   result = books.permutation.map{|element|
      (0..element.length).map{|size|
        partial_total = 0
        basket_split(element, size).each{|books_splited|
          if discount_applicable?(books_splited)
            partial_total += calculate_discount_price(books_splited.count)
          else 
            partial_total += books_splited.count * BOOK_PRICE
          end
        }
        partial_total          
      }.min    
    }.min
    return result
end