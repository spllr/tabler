require "spec_helper"
require "tabler"

describe Tabler do
  describe ".generate" do
    it 'returns a CSV string' do
      Tabler.generate([{ :col1 => "val 1", :col2 => "val 2" }], :col_sep => ";").should == "col1;col2\nval 1;val 2\n"
    end
  end
end
