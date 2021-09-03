module Packages
  class BaseQuery < ::BaseQuery    
    def base_relation
      current_user.packages
    end
  end 
end

