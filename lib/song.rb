class Song

    extend Concerns::Findable

    @@all = []

    attr_accessor :name
    attr_reader :artist, :genre

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist.class == Artist
        self.genre = genre if genre.class == Genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        Song.new(name).tap{|song| song.save}     
    end

    def save
        self.class.all << self
    end

    def self.new_from_filename(filename)
        arr = filename.gsub(".mp3", "").split(" - ")
        temp_artist = arr[0]
        temp_name = arr[1]
        temp_genre = arr[2]
        
        self.new(temp_name).tap { |song| 
            song.artist = Artist.find_or_create_by_name(temp_artist)
            song.artist.add_song(song)
            song.genre = Genre.find_or_create_by_name(temp_genre)
            song.genre.add_song(song)
        }
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

    def self.sort_by_song_name
        @@all.sort_by! {|song| song.name}
    end

    #-----------------------------INTER RELATIONS-----------------

    def artist=(artist)
        @artist = artist unless @artist == artist
        artist.add_song(self) unless artist.songs.include?(self)
    end

    def genre=(genre)
        @genre = genre unless @genre == genre
        genre.add_song(self) unless genre.songs.include?(self)
    end
end