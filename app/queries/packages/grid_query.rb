module Packages
  class GridQuery < BaseQuery
    def base_relation 
      relation = Packages::BaseQuery.call(user: current_user) 
    end
    
    def execute 
      relation
    end
  end
end

