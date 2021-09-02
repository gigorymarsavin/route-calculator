class Query
  attr_accessor :current_user, :relation, :per_page, :params 

  def initialize(params)
    @current_user = params[:current_user]
    @relation = nil
    @per_page = params[:per_page]
    @params = params 
  end

  def self.call(params)
    new(params).call
  end

  def call 
    base_relation
    execute
    paginate 
  end

  def base_relation 
    raise NotImplementedError, "#{self.class} has not method: #{__method__}"
  end

  def execute 
    raise NotImplementedError, "#{self.class} has not method: #{__method__}"
  end

  def paginate 
    relation.page(params[:page]).per(per_page)
  end
end