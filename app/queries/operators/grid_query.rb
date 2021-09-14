module Operators
  class GridQuery < GridBaseQuery
    def base_relation
      Operators::BaseQuery.call(current_user: current_user)
    end
  end
end