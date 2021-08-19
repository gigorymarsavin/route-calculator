require_relative 'calculator'

class Proxy
  attr_reader :service, :addr_to, :addr_from

  def initialize(params={})
    @addr_from = params[:addr_from]
    @addr_to = params[:addr_to]
    @service = Api.find_by(status: true)[:name]
  end

  def self.call(params={})
    new(params).get_distance(params)
  end

  def get_distance(params)
    params[:distance] = Object.const_get("#{service}").call(addr_to, addr_from)
  end
end