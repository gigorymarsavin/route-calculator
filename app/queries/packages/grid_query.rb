module Packages
  class GridQuery < GridBaseQuery
    def base_relation
      Packages::BaseQuery.call(current_user: current_user)
    end
  end
end

