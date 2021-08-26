module Packages
  class BaseQuery
    attr_accessor :current_user

    def initialize(params)
      @current_user = params[:user]
    end

    def self.call(params)
      new(params).all_packages
    end

    def all_packages
      Package.all
    end
  end
end

