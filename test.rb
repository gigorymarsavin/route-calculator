require 'rspec'
require_relative 'main'
require_relative 'calculator'


describe Calculator do
  it 'should calculate correctly' do
    small_size_low_weigth = Calculator.call( 10,20,30,5, 1000.0)
    expect(small_size_low_weigth[:price]).to eq 1000.0

    big_size_low_weigth = Calculator.calculate(100,200,300,5, 1000.0)
    expect(big_size_low_weigth[:price]).to eq 2000.0

    big_size_big_weigth = Calculator.calculate(100,200,300,50, 1000.0)
    expect(big_size_big_weigth[:price]).to eq 3000.0

    small_size_big_weigth = Calculator.calculate(10,20,30,50, 1000.0)
    expect(small_size_big_weigth[:price]).to eq 1000.0
    
    low_size_equal_weigth = Calculator.calculate(6, 20, 10, 10, 1000.0)
    expect(low_size_equal_weigth[:price]).to eq 1000.0

    big_size_equal_weigth = Calculator.calculate(600, 200, 10, 10, 1000.0)
    expect(big_size_equal_weigth[:price]).to eq 2000.0
  end
end



