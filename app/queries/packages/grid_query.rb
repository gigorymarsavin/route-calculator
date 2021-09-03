module Packages
  class GridQuery < Grid     
    attr_accessor :sort, :per_page, :page, :current_user

    def initialize(params)
      @page = params[:page]
      @per_page = params[:per_page]
      @sort = params[:sort] || 'created_at'
      @current_user = params[:current_user]
    end

    def base_relation 
      @relation ||= Packages::BaseQuery.call(current_user: current_user)
    end
    
    def execute_sort  
      @relation = @relation.order("#{sort} DESC")
    end

    def execute_paginate
      
      @relation = @relation.page(page).per(per_page)
    end

  end
end

