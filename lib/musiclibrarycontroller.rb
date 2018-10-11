class MusicLibraryController

    attr_accessor :path

    def initialize(filepath="./db/mp3s")
        self.path = filepath
        MusicImporter.new(self.path).import
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
        input = nil
        while input != "exit"
            input = gets.chomp
            if input == "list songs"
                list_songs 
            elsif input == "list artists"
                list_artists
            elsif input == "list genres"
                list_genres
            elsif input == "list artist"
                list_songs_by_artist
            elsif input == "list genre"
                list_songs_by_genre
            elsif input == "play song"
                play_song
                puts ""
                sleep(3)
            end
            puts "What would you like to do?" if input != "exit"
        end
    end

    def list_songs
        Song.sort_by_song_name
        Song.all.each.with_index(1) {|song, i| print_song(song, i) }
        
    end

    def print_song(song, i)
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    
    
    #----------------------LISTING ARTISTS-------------------
    def list_artists
        Artist.sort_by_name
        Artist.all.each.with_index(1) {|artist, i| print_artist(artist, i) }
    end

    def print_artist(artist, i)
        puts "#{i}. #{artist.name}"
    end

    #-----------------------Listing Genres-----------------------------------------------------
    def list_genres 
        Genre.sort_by_name
        Genre.all.each.with_index(1) {|genre, i| print_genre(genre, i)}
    end 

    def print_genre(genre, i)
        puts "#{i}. #{genre.name}"
    end 

    #------------------------------LIST SONGS BY ARTIST-----------------

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
        artist = Artist.find_by_name(artist_name)
        if artist 
            artist.songs.sort_by! {|song| song.name}
            artist.songs.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}           
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.strip
        genre = Genre.find_by_name(genre_name)
        if genre 
            genre.songs.sort_by! {|song| song.name}
            genre.songs.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}          
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        Song.sort_by_song_name
        song_num = gets.chomp.to_i
        if (song = Song.all[song_num - 1]) && song_num > 0 && song_num <= Song.all.length
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end

end
