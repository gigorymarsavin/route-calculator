module Packages
  class GridQuery
      attr_accessor :current_user

      def initialize(params)
        @current_user = params[:user]
      end

      def self.call(params)
        new(params).sort
      end

      def sort
        Package.order(name: :asc)
      end
  end
end

