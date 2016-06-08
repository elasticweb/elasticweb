require 'elasticweb/client/databases/users'

module ElasticWeb
  class Client
    module Databases
      include ElasticWeb::Client::Databases::Users

      def databases(account_id)
        get("/database/list/#{account_id}")
      end

      def create_database(account_id, options)
        post("/database/entry/#{account_id}", options)
      end

      def delete_database(account_id, db_name)
        delete("/database/entry/#{account_id}/#{db_name}")
      end
    end
  end
end