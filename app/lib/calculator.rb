class Calculator
  attr_reader :height, :length, :width, :weight, :distance

  def initialize(distance, h={})
    @height = h[:height]
    @length = h[:length]
    @width = h[:width]
    @weight = h[:weight]
    @distance = distance
  end

  def call
    size = (@height.to_f * @length.to_f * @width.to_f) / 1000000
    price = (distance.to_f if size <= 1) || (distance.to_f * 2.0 if size >= 1 && @weight <= 10) || distance.to_f * 3.0
    {height: @height, length: @length, width: @width, weight: @weight, distance: distance, price: price, size: size}
  end
end