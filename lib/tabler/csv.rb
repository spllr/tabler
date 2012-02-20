require "csv"

module Tabler
  class CSV
    attr_reader :data

    def initialize(data)
      @data = data
    end

    # Create a csv string from the data
    #
    def generate(opts={})
      nd = normalized_data
      ::CSV.generate(opts) do |csv|
        # set header row
        csv << nd[:headers]
        nd[:values].each do |row|
          csv << row
        end
      end
    end

    # Creates a hash with a :headers field
    # and a :values field
    #
    def normalized_data
      result = {}
      result[:headers] = data.inject([]) do |h,a|
        a.each { |k,v| h << k unless h.include?(k) }
        h
      end

      result[:values] = data.map do |h|
        row = []
        h.each do |k,v|
          index_of_key = result[:headers].index(k)
          row[index_of_key] = v
        end
        row
      end
      result
    end
  end
end
