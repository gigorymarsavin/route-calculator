module Packages
  class BaseQuery
      attr_accessor :scope

      def initialize(scope)
        @scope = scope
      end

      def self.call(scope, params)
        new(params).sort(scope)
      end

      def sort(scope)
        scope.order(price: :desc)
      end
  end
end