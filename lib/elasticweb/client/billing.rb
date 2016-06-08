module ElasticWeb
  class Client
    module Billing
      def operation_types
        get('/billing/operation_types')
      end

      def operations(type_name)
        get("/billing/operations/#{type_name}")
      end
    end
  end
end