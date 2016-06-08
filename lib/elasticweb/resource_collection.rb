module ElasticWeb
  class ResourceCollection < Resource
    include Enumerable

    attr_reader :options, :collection, :pager

    def initialize(original_data, options = {})
      original_data.merge!({ data: [] }) unless original_data.dig(:data).is_a?(Array)

      data = original_data.dig(:data)
      @collection = Array(data).map do |resource|
        Resource.new(data: resource)
      end

      if (pager = original_data.delete(:pager))
        @pager = OpenStruct.new({
            total: pager[:total],
            per_page: pager[:per_page],
            current_page: pager[:current_page],
            next_page_url: pager[:next_page_url],
            prev_page_url: pager[:prev_page_url]
        })
      else
        @pager = nil
      end

      references = original_data.delete(:references) { Hash.new }
      @refs = references.present? ? OpenStruct.new(parse_references(references)) : nil
      @options = options.with_indifferent_access
    end

    def each
      return enum_for(:each) unless block_given?

      @collection.each { |item| yield item }
    end
  end
end