class Calculator 
  def self.call(distance, h={})
    size = (h.fetch('height').to_f * h.fetch('length').to_f * h.fetch('width').to_f) / 1000000
    price = (distance.to_f if size <= 1) || (distance.to_f * 2.0 if size >= 1 and h.fetch('weight') <= 10) || distance.to_f * 3.0
    {height: h.fetch('height'), length: h.fetch('length'), width: h.fetch('width'), weight: h.fetch('weight'), distance: distance, price: price, size: size}
  end
end