class Song
  attr_accessor :name , :genre
   attr_reader :artist 
  @@all = []

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




end