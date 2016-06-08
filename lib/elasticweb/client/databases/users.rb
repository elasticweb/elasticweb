module ElasticWeb
  class Client
    module Databases
      module Users
        def databases_users(account_id)
          get("/database_user/list/#{account_id}")
        end

        def database_user_info(account_id, db_user_name)
          get("/database_user/entry/#{account_id}/#{db_user_name}")
        end

        def create_database_user(account_id, options)
          post("/database_user/entry/#{account_id}", options)
        end

        def update_database_user(account_id, db_user_name, options)
          patch("/database_user/entry/#{account_id}/#{db_user_name}", options)
        end

        def delete_database_user(account_id, db_user_name)
          delete("/database_user/entry/#{account_id}/#{db_user_name}")
        end
      end
    end
  end
end