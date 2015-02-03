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
  #return calculate_discount_price(books.count) if discount_applicable?(books)
  
  #if discount_applicable?(books)
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
        #puts "partial_total= #{partial_total}"
        partial_total          
      }.min    
    }.min
    #puts "result=#{result}"
    return result
    
    #price_with_disccount = calculate_discount_price(books.uniq.count) 
    #books.uniq.each {|book| 
    #  index_to_delete = books.index(book)
    #  books.slice!(index_to_delete)
    #}
    #return price_with_disccount + books.count * BOOK_PRICE 
    #else
    #  books.count * BOOK_PRICE 
    #end
  

end