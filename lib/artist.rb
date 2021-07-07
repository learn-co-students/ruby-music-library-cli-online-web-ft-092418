class Artist 
  attr_accessor :name , :songs 
  @@all = []
  extend Concerns::Findable

def initialize (name)
  @name = name
  @songs = []
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
  artist = self.new(name)
  artist.save
  artist 
end 


def add_song(song)
  self.songs << song if !self.songs.include?(song)
  song.artist = self if !song.artist 
  
end

def genres
  self.songs.map{ |song| song.genre}.uniq
end

  
end