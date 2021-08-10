class Calculator 
  def self.call(height, width, length, weight, distance)
    size = (height.to_f * length.to_f * width.to_f) / 1000000
    price = (distance.to_f if size <= 1) || (distance.to_f * 2.0 if size >= 1 and weight <= 10) || distance.to_f * 3.0
    result = {height: height, length: length, width: width, weight: weight, distance: distance, price: price, size: size}
  end
end