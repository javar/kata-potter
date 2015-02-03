require "test/unit"
require_relative "./kata_potter"

class TestPotter < Test::Unit::TestCase
  
  
  def test_empty_basket_result_0
    assert_equal 0, basket([])
  end

  def test_single_book_cost_8
    assert_equal 8, basket([1])
  end
  
  def test_two_equal_books_cost_16
    assert_equal 16, basket([1,1])
  end
  
  def test_three_equal_books_cost_24
    assert_equal 24, basket([1,1,1])
  end
  
  def test_two_different_books_have_a_discount_5_percent
    assert_equal 15.2, basket([1,2])
  end
  
  def test_three_different_books_have_a_discount_10_percent
    assert_equal 21.6, basket([1,2,3])
    assert_equal 21.6, basket([1,2,4])
  end
  
  def test_four_different_books_have_a_discount_20_percent
    assert_equal 25.6, basket([1,2,3,5])
    assert_equal 25.6, basket([1,2,3,4])
  end
  
  def test_five_different_books_have_a_discount_25_percent
    assert_equal 30, basket([1,2,3,4,5])
  end
  
  def test_3_different_books_and_one_repeated_book
    assert_equal 29.6, basket([1,2,3,1])
  end
  
  def test_2_different_books_and_3_repeated_book
    assert_equal 51.20, basket([1,1,2,2,3,3,4,5])
    #assert_equal 51.20, basket([1,2,3,4,1,2,3,5])
  end

end