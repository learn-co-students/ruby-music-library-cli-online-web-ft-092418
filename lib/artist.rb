class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []
  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.create(name)
    self.new(name).tap {|art| art.save}
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

end
