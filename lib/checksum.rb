class Checksum

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

  def differ
    num = []
    sort_inner.each { |b|  num << b[b.length-1] - b[0] }
    num
  end

  def get_sum
    differ.inject(0) { |sum,x| sum + x }
  end
end
