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
    
    
    case demand
    when "list songs"
    self.list_songs
    when 'list artists'
    self.list_artists
    when 'list genres'
    self.list_genres
    when 'list artist'
    self.list_songs_by_artist
    when 'list genre'
    self.list_songs_by_genre
    when 'play song'
    self.play_song
    end
    
    demand = gets.strip
    
    end
    
   
  end 
  
  def list_songs
   
    Song.all.sort { |x,y| x.name <=> y.name}.each_with_index{ |val,index| puts "#{index+1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"  }
     
  end
  
  
  def list_artists
       Artist.all.sort { |x,y| x.name <=> y.name}.each_with_index{ |val,index| puts "#{index+1}. #{val.name}" }
     
  end
  
  def list_genres
       Genre.all.sort { |x,y| x.name <=> y.name}.each_with_index{ |val,index| puts "#{index+1}. #{val.name}" }
     
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    
    
    artist = Artist.all.find{|a| a if a.name == artist_name}
    
    if artist 
      artist_songs = artist.songs 
      artist_songs.sort_by{|s| s.name }.each_with_index{ |val,index| puts "#{index+1}. #{val.name} - #{val.genre.name}" }
      
    end
  
  end
  
    def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    
    
    genre = Genre.all.find{|a| a if a.name == genre_name}
    
    if genre
      genre_songs = genre.songs 
      genre_songs.sort_by{|s| s.name }.each_with_index{ |val,index| puts "#{index+1}. #{val.artist.name} - #{val.name}" }
      
    end
  
  end
  
  def play_song
    puts "Which song number would you like to play?"
    
    song_number = gets.strip.to_i
    
    songs_sorted = Song.all.sort_by {|song| song.name}
    if song_number >0 && song_number < songs_sorted.length+1
    song_name = songs_sorted[song_number-1].name
    artist_name = songs_sorted[song_number-1].artist.name
    puts "Playing #{song_name} by #{artist_name}"
  end
    
  end
  
  
  
  
  
end