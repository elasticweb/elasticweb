module ElasticWeb
  class Client
    module Aliases
      def aliases(account_id)
        get("/alias/list/#{account_id}")
      end

      def create_alias(account_id, options)
        post("/alias/entry/#{account_id}", options)
      end

      def update_alias(alias_name, options)
        patch("/alias/entry/#{alias_name}", options)
      end

      def delete_alias(alias_name)
        delete("/alias/entry/#{alias_name}")
      end
    end
  end
end