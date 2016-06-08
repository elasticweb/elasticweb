module ElasticWeb
  class Client
    module DNS
      def domain_dns(domain_name)
        get("/dns/list/#{domain_name}")
      end

      def dns(id)
        get("/dns/entry/#{id}")
      end

      def create_dns(domain_name, options)
        post("/dns/entry/#{domain_name}", options)
      end

      def delete_dns(id)
        delete("/dns/entry/#{id}")
      end
    end
  end
end