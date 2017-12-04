class Checksum

  attr_reader :ar_of_ar

  def initialize(filename)
    @filename = filename
    @ar_of_ar = Array.new
  end

  def read_file
    File.read(@filename)
  end

  def data_array
    read_file.split("\n").each { |n|  @ar_of_ar << n.gsub("\t", ",").split(",") }
    @ar_of_ar.each{ |n| n.map! { |b| b.to_i } }
  end

  def sort_inner
    data_array.each { |n| n.sort! }
  end



end
