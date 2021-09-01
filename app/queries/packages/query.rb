class BaseQuery
  attr_accessor :current_user, :relation

  def initialize(params)
    @current_user = params[:user]
    @relation = nil 
  end

  def self.call(params)
    new(params).call
  end

  def call 
    base_relation
    execute 
  end

  def base_relation 

  end

  def execute 

  end
end