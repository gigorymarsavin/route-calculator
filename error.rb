class SizeError < StandardError
  def initialize
    message = 'width, height, length or weight value must be greater than zero' 
    super(message)
  end
end


