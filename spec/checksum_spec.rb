require 'spec_helper'
require 'checksum'

describe Checksum do
  subject(:checksum) { described_class.new(filename) }
  let(:file) {
    File.open(filename, "r")
  }
  let(:filename) { "text.txt" }
  describe "#read_file" do
    it "returns content of the file" do
      expect(subject.read_file).to eq(file.read)
    end
  end
end
