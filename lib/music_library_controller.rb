class  MusicLibraryController
  attr_accessor :path
  
  def initialize (path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end
  
  
  def call 
    
    puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
    
  end 
  
  
end