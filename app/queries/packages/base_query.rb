module Packages
  class BaseQuery < BaseQuery
    def base_relation 
      relation = current_user.packages
    end
  
    def execute 
      relation
    end
    
  end
end

