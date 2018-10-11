class Artist

    extend Concerns::Findable

    @@all = []

    attr_accessor :name
    attr_reader :songs

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        Artist.new(name).tap{|artist| artist.save}     
    end

    def save
        self.class.all << self
    end

    def self.sort_by_name
        @@all.sort_by! {|artist| artist.name}
    end

    #-----------------------------INTER RELATIONS-----------------

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.artist = self unless song.artist == self
    end

    def genres
        songs.map { |song| song.genre}.uniq
    end 
    

end