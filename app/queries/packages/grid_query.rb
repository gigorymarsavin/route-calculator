module Packages
  class GridQuery < Query
    attr_accessor :sort, :params, :per_page

    def initialize(params)
      super
      @sort = params[:sort] || 'created_at'
    end

    def base_relation 
      @relation ||= Packages::BaseQuery.call(current_user: current_user)
    end
    
    def execute 
      relation.order("#{sort} DESC")
    end
  end
end

