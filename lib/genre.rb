class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  def initialize(name)
    self.name = name
    self.songs = []
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

  def self.create(name)
    self.new(name).tap {|gen| gen.save}
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
end
