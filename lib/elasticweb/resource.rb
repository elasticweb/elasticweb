module ElasticWeb
  class Resource
    attr_reader :data, :refs, :status, :message

    def initialize(original_data)
      @status = original_data.dig(:status)
      @message = original_data.dig(:message)

      original_data = {} unless original_data.dig(:data).is_a?(Hash)

      references = original_data.delete(:references)
      refs_collection = parse_references(references)
      @refs = refs_collection.present? ? OpenStruct.new(refs_collection) : nil

      data = original_data.dig(:data)
      @data = OpenStruct.new(data.with_indifferent_access)
    end

    def parse_references(references)
      (references || {}).each_with_object({}) do |(reference, value), result|
        case value
          when Hash then result[reference] = Relation.new(value)
          when Array then result[reference] = RelationCollection.new(value)
        end
      end
    end

    def method_missing(method_sym, *arguments, &block)
      if @data.respond_to?(method_sym)
        @data.send(method_sym)
      else
        super
      end
    end
  end
end
