module ElasticWeb
  class Client
    module Servers
      def servers
        get('/server/list')
      end
    end
  end
end