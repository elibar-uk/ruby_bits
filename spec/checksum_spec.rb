require 'spec_helper'
require 'checksum'

describe Checksum do
  subject(:checksum) { described_class.new(filename) }
  let(:file) {
    File.open(filename, "r")
  }
  let(:filename) { "text.txt" }
  let(:expected_sum) { 34581 }
  describe "#read_file" do
    it "returns content of the file" do
      expect(subject.read_file).to eq(file.read)
    end
  end

  describe "#data_array" do
    it "returns file data in multi-dimensional array" do
      ar = [1224,926,1380,688,845,109,118,88,1275,1306,91,796,102,1361,27,995]
      expect(subject.data_array.first).to eq(ar)
    end
  end

  describe "#sort_inner" do
    it "returns array of sorted arrays" do
      sorted_ar = [27,88,91,102,109,118,688,796,845,926,995,1224,1275,1306,1361,1380]
      expect(subject.sort_inner.first).to eq(sorted_ar)
    end
  end

  describe "#differ" do
    it "returns array of differences min max" do
      dif = [1353,1980,1174,833,1774,3190,261,343,492,3367,2336,1154,3275,2641,4868,5540]
      expect(subject.differ).to eq(dif)
    end
  end

  describe "#get_sum" do
    it "returns sum of min and max differences of all arrays" do
      expect(subject.get_sum).to eq(expected_sum)
    end
  end
end
