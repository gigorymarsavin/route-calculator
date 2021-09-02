module Packages
  class GridQuery < Query
    attr_accessor :sort, :params, :per_page

    def initialize(params)
      super
      @sort = params[:sort] || 'created_at'
      @params = params
      @per_page = params[:per_page]
    end

    def base_relation 
      @relation ||= Packages::BaseQuery.call(current_user: current_user).page(params[:page]).per(per_page)
    end
    
    def execute 
      relation.order("#{sort} DESC")
    end
  end
end

