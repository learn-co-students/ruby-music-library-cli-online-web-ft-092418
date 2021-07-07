class MusicImporter
  
  attr_accessor :path , :files
  
def initialize(pathname)
  self.path = pathname
  @files = []

end

def files

  Dir.entries(@path).each do
    |f| @files << f if f.include?(".mp3")
   end
  @files
end


  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

  
end