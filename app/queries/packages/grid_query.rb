module Packages
  class GridQuery < Grid    
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

