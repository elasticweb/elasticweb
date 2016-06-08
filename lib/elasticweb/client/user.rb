module ElasticWeb
  class Client
    module User
      def me
        get('/user/me')
      end
    end
  end
end