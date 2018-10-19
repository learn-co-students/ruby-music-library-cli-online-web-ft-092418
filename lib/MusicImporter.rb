class MusicImporter
  attr_accessor :path
  def initialize(path) 
    @path = path
  end
  
  def files 
    file_array = Dir.glob(self.path + "/*.mp3")
    file_array.collect{ |file| file.gsub(self.path + "/", "")}
  end
  
  def import 
    files.each { |file| Song.create_from_filename(file)}
  end
end