# Kata Potter

# Magic Number
BOOK_PRICE = 8
MIN_BOOKS_FOR_DISCOUNT = 2

def calculate_discount_price(books)
  discounts = [0.95, 0.90, 0.80, 0.75]
  BOOK_PRICE * books * discounts[books - 2]
end

def discount_applicable?(books)
  books.count >= MIN_BOOKS_FOR_DISCOUNT
end

def basket(books)
  
  if books.count == books.uniq.count
    if discount_applicable?(books)
      return calculate_discount_price(books.count)
    end
    return books.count * BOOK_PRICE
  end
  
  books.count * BOOK_PRICE
  
  
end