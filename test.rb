require 'minitest/autorun'
require_relative 'route-calculate'
require_relative 'calculator'

class TestApi < Minitest::Test
  def correctly_connect_mapbox
    mapbox_api = RouteCalculate.get_price('Moscow', 'Berlin', 'mapbox', 120,23,230,4)
    assert mapbox_api != 0.0  
  end

  def correctly_connect_matrix
    matrix_api = RouteCalculate.get_price('Moscow', 'Berlin', 'matrix', 120,23,230,4)
    assert matrix_api != 0.0  
  end

  def correctly_connect_distanceorg
    distanceorg_api = RouteCalculate.get_price('Moscow', 'Berlin', 'distanceorg', 120,23,230,4)
    assert distanceorg_api != 0.0  
  end
end

class TestCalculator < Minitest::Test 
  def test_small_size_low_weigth 
    small_size_low_weigth = Calculator.calculate( 10,20,30,5, 1000.0)
    assert small_size_low_weigth[:price] == 1000.0
  end

  def test_big_size_low_weigth
    big_size_low_weigth = Calculator.calculate(100,200,300,5, 1000.0)
    assert big_size_low_weigth[:price] == 2000.0
  end

  def test_big_size_big_weigth
    big_size_big_weigth = Calculator.calculate(100,200,300,50, 1000.0)
    assert big_size_big_weigth[:price] == 3000.0
  end

  def test_small_size_big_weigth 
    small_size_big_weigth = Calculator.calculate(10,20,30,50, 1000.0)
    assert small_size_big_weigth[:price] == 1000.0
  end

  def test_equal_size
    equal_size = Calculator.calculate(476, 21, 100, 50, 1000.0)
    assert equal_size[:price] == 1000.0 
  end

  def test_low_size_equal_weigth
    low_size_equal_weigth = Calculator.calculate(6, 20, 10, 10, 1000.0)
    assert low_size_equal_weigth[:price] == 1000.0
  end

  def test_big_size_equal_weigth
    big_size_equal_weigth = Calculator.calculate(600, 200, 10, 10, 1000.0)
    assert big_size_equal_weigth[:price] == 2000.0
  end
end