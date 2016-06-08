module ElasticWeb
  class Client
    class Errors
      attr_reader :status, :message, :errors

      def initialize(data)
        @status = data.dig(:status)
        @message = data.dig(:message)
        # Нету общего формата ошибок
        @errors = data.dig(:errors) || data.dig(:error)
      end
    end
  end
end