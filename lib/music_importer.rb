require "pry"
class MusicImporter
  attr_accessor :path
  def initialize(file_path)
    self.path = file_path
  end

  def files
    #binding.pry
    Dir[self.path+"/*"].map {|file| file.split("/").last}
  end

  def import
    self.files.map {|filename|     Song.create_from_filename(filename)}
  end
end
