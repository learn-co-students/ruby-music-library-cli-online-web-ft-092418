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
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    demand = gets.strip
    
    while demand !="exit"
    
    
    demand = gets.strip
  end
    
   
  end 
  
  def list_songs
   
    Song.all.sort { |x,y| x.name <=> y.name}.each_with_index{ |val,index| puts "#{index+1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"  }
     
  end
  
  
  def list_artists
       Artist.all.sort { |x,y| x.name <=> y.name}.each_with_index{ |val,index| puts "#{index+1}. #{val.name}" }
     
    
  end
  
  
end