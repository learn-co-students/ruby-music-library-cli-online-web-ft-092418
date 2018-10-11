require "pry"
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    (song = self.find_by_name(name)) ? song : self.create(name)
  end

  def self.new_from_filename(filename)
    arr = filename.gsub(".mp3", "").split(" - ")
    self.new(arr[1]).tap {|song|
      song.artist = Artist.find_or_create_by_name(arr[0])
      song.genre = Genre.find_or_create_by_name(arr[2])
    }
  end

  def self.create_from_filename(filename)
      self.new_from_filename(filename).tap {|song| song.save}
  end



  def self.create(name)
    self.new(name).tap{|song| song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end
end
