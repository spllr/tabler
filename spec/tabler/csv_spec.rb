require "spec_helper"
require "tabler/csv"

require "csv"

describe Tabler::CSV do
  let(:data) {
    [
      { :col1 => "val 1", :col2 => "val 2"}, 
      { :col1 => "row 2 val 1", :col2 => "row 2 val 2"},
      { :col1 => "row 3 val 1", :col3 => "row 3 val 3", :col2 => "row 3 val 2"},
      { :col1 => "row 4 val 1", :col3 => "row 4 val 3" }
    ]
  }

  describe "#generate" do
    subject do
      csv_string = Tabler::CSV.new(data).generate(:col_sep => "\t")
      CSV.parse(csv_string, :col_sep => "\t", :headers => true)
    end

    it 'sets the column headers' do
      subject.headers.should == ["col1", "col2", "col3"]
    end

    it 'contains all the rows' do
      row_count = 0
      subject.each { row_count += 1 }
      row_count.should == 4
    end
  end

  describe ".normalized_data" do
    subject do
      Tabler::CSV.new(data).normalized_data
    end

    it 'sets the :headers' do
      subject[:headers].should == [:col1, :col2, :col3]
    end

    it 'create a row in :values for each row in the data' do
      subject[:values].size.should == 4
    end

    it 'creates the correct values for each row' do
      subject[:values][0].should == ["val 1", "val 2"]
      subject[:values][1].should == ["row 2 val 1", "row 2 val 2"]
      subject[:values][2].should == ["row 3 val 1", "row 3 val 2", "row 3 val 3"]
      subject[:values][3].should == ["row 4 val 1", nil, "row 4 val 3"]
    end
  end
end
