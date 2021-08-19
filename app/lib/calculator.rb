class Calculator
  attr_reader :height, :length, :width, :weight, :distance

  def initialize(params = {})
    @height = params[:height]
    @length = params[:length]
    @width = params[:width]
    @weight = params[:weight]
    @distance = params[:distance]
  end

  def self.call(params = {})
    new(params).result_hash
  end

  def size
    (height.to_f * length.to_f * width.to_f) / 1_000_000
  end

  def price
    (distance.to_f if size <= 1) || (distance.to_f * 2.0 if size >= 1 && @weight <= 10) || distance.to_f * 3.0
  end

  def result_hash
    { height: height, length: length, width: width, weight: weight, distance: distance, price: price, size: size }
  end
end