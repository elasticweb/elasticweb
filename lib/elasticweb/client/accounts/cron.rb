module ElasticWeb
  class Client
    module Accounts
      module Cron
        def update_cron(id, options)
          patch("/account/entry/#{id}", options)
        end
      end
    end
  end
end