module Packages
  class BaseQuery < Query
    attr_accessor :params, :per_page 

    def initialize(params)
       super 
       @params = params
       @per_page = params[:per_page]
    end

    def base_relation 
      @relation ||= current_user.packages.page(params[:page]).per(per_page)
    end
  
    def execute 
      relation
    end
    
  end
end

