require "tabler/version"
require "tabler/csv"

module Tabler
  def self.generate(data, opts={})
    Tabler::CSV.new(data).generate(opts)
  end
end
