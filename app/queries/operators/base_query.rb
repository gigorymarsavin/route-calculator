module Operators
  class BaseQuery < ::BaseQuery
    def base_relation
      if current_user.is_admin
        User.where(organisation_id: current_user.organisation_id, is_admin: false)
      else 
        current_user.packages
      end
    end
  end
end
