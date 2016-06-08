module ElasticWeb
  class Client
    module Connection

      def get(path, options = {})
        request :get, path, options
      end

      def post(path, options = {})
        request :post, path, options
      end

      def put(path, options = {})
        request :put, path, options
      end

      def delete(path, options = {})
        request :delete, path, options
      end

      private

      def request(http_method, path, options = {})
        response = self.class.send(http_method, path, { query: options })
        original_data = response.parsed_response

        return unless original_data

        data = original_data.with_indifferent_access

        case response.code
          when 200..201
            parse_data(data)
          when 400..600
            parse_errors(data)
        end
      end

      def parse_data(data)
        # При создании аккаунта возвращаются данные с ключом account вместо data.
        if data.has_key?(:account)
          data[:data] = data.delete(:account)
        end

        case data.dig(:data)
          when Hash then Resource.new(data)
          when Array then ResourceCollection.new(data)
          when nil then nil
          else data
        end
      end

      def parse_errors(data)
        case data
          when Hash then Client::Errors.new(data)
          when nil then nil
          else data
        end
      end
    end
  end
end