class Song
  attr_accessor :name 
   attr_reader :artist , :genre
  @@all = []
  extend Concerns::Findable

def initialize (name , artist = nil , genre = nil)
  self.name = name
  self.artist = artist if artist
  self.genre = genre if genre 
end

def self.all 
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end 
  
def self.create(name )
  song = self.new(name)
  song.save
  song 
end 

 def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
end

 def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
end

def self.find_by_name (name)
  self.all.detect{ |song| song.name==name}
end 

def self.find_or_create_by_name (name)
  if self.find_by_name (name)
    self.find_by_name (name)
  else
    song = self.create(name)
    song
  end
end 

def self.new_from_filename(filename)
  artist_name = filename.split("-")[0].strip
  song_name = filename.split("-")[1].strip
  genre_name = filename.split("-")[2].split(".mp3").join("").strip
  genre_name = "hip-hop" if genre_name =="hip"
  artist = Artist.find_or_create_by_name (artist_name)
  genre = Genre.find_or_create_by_name (genre_name)
  song = self.new(song_name  , artist ,genre )
  song
end


  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  
  
end