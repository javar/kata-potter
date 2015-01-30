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

def basket(books)
  return calculate_discount_price(books.count) if discount_applicable?(books)
  price_with_disccount = 0
  
  if discount_applicable?(books.uniq)
    price_with_disccount = calculate_discount_price(books.uniq.count) 
  
    books.uniq.each {|book| 
      index_to_delete = books.index(book)
      books.slice!(index_to_delete)
    }
    return price_with_disccount + books.count * BOOK_PRICE
  
  end
  books.count * BOOK_PRICE
end