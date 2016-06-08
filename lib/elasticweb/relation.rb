module ElasticWeb
  class Relation
    attr_reader :data

    def initialize(data)
      @data = OpenStruct.new(data)
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