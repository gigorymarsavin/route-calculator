module Packages
  class GridQuery < Query
    attr_accessor :sort 

    def initialize(params)
      super
      @sort = params[:sort]
    end

    def base_relation 
      @relation = Packages::BaseQuery.call(current_user: current_user) 
    end
    
    def execute 
      relation.order("#{sort} DESC")
    end
  end
end

