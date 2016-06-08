module ElasticWeb
  class Client
    module Domains
      def domains(account_id)
        get("/domain/list/#{account_id}")
      end

      def create_domain(account_id, options)
        post("/domain/entry/#{account_id}", options)
      end

      def update_domain(domain_name, options)
        patch("/domain/entry/#{domain_name}", options)
      end

      def delete_domain(domain_name)
        delete("/domain/entry/#{domain_name}")
      end
    end
  end
end