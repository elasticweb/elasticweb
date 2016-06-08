require 'elasticweb/client/accounts/cron'

module ElasticWeb
  class Client
    module Accounts
      include ElasticWeb::Client::Accounts::Cron

      def accounts
        get('/account/list')
      end

      def create_account(options)
        post('/account/entry', options)
      end

      def update_account(id, options)
        patch("/account/entry/#{id}", options)
      end

      def delete_account(id)
        delete("/account/entry/#{id}")
      end
    end
  end
end