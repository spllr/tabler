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

    alias_method :to_csv, :generate
    alias_method :to_s, :generate

    # Creates a hash with a :headers field
    # and a :values field
    #
    def normalized_data
      result = { :headers => [], :values => [] }

      data.each do |row|
        values = []
        row.each do |key,val|
          # add the header field if needed
          result[:headers] << key unless result[:headers].include?(key)

          # build the values array
          index_of_header = result[:headers].index(key)
          values[index_of_header] = val
        end
        result[:values] << values
      end
      result
    end
  end
end
