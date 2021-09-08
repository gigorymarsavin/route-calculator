class PackageMailerBase
  attr_accessor :email, :name, :surname, :midname, :phone, :weight, :size, :addr_to, :addr_from, :price, :defaults 

  def initialize(params)
    @email = params[:params]['email']
    @name = params[:params]['name']
    @surname = params[:params]['surname']
    @midname = params[:params]['midname']
    @phone = params[:params]['phone']
    @weight = params[:params]['weight']
    @size = params[:params]['size']
    @addr_to = params[:params]['addr_to']
    @addr_from = params[:params]['addr_from']
    @price = params[:params]['price']
  end

  def self.defaults(params)
    PackageBase.new(params)
  end
end