module ElasticWeb
  class RelationCollection < Relation
    include Enumerable

    attr_reader :options, :collection

    def initialize(data, options = {})
      data = [] unless data.is_a?(Array)

      @collection = Array(data).map do |item|
        Relation.new(item)
      end

      @options = options.with_indifferent_access
    end

    def each
      return enum_for(:each) unless block_given?

      @collection.each { |item| yield item }
    end
  end
end