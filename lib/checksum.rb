class Checksum

  def initialize(filename)
    @filename = filename
  end

  def read_file
    File.read(@filename)
  end

end
