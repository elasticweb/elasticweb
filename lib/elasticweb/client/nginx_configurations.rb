module ElasticWeb
  class Client
    module NGINXConfigurations
      def nginx_configurations
        get('/domain/nginx_configurations')
      end
    end
  end
end