module Packages
  class GridQuery < GridBaseQuery

    attr_accessor :oper_id 

    def initialize(params)
      super 
      @oper_id = params[:oper_id]
    end

    def base_relation
      Packages::BaseQuery.call(current_user: current_user)
    end

    def execute
      self.relation = relation.where(user_id: oper_id) if oper_id.present?
    end

  end
end