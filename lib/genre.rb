class Genre

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
        Genre.new(name).tap{|genre| genre.save}     
    end

    def save
        self.class.all << self
    end

    def self.sort_by_name 
        @@all.sort_by! {|genre| genre.name}
    end 
    
    #-----------------------------INTER RELATIONS-----------------

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.genre = self unless song.genre == self
    end

    def artists
        songs.map { |song| song.artist}.uniq
    end 

    #-----------------------------FINDERS-----------------


end