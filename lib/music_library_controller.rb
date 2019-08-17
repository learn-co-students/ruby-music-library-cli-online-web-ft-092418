class MusicLibraryController
  attr_accessor :songs
  def initialize(path = './db/mp3s')
    self.songs = MusicImporter.new(path).import
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
    input = gets.chomp.downcase
    #binding.pry

    while input != "exit"
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
      end

      input = gets.chomp.downcase
    end
  end

  def list_songs
    #binding.pry
    Song.all.sort_by{|s| s.name}.each.with_index(1) {|s, index| puts "#{index}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}

    # self.songs.sort_by{|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}


    # self.songs.sort_by {|x|
    #   #binding.pry
    #   x.split(" - ")[1]}.each.with_index(1) {|songs, index|
    #   #binding.pry
    #   puts "#{index}. #{songs.gsub(".mp3", "")}"
    # }
  end

  def list_artists
  #  binding.pry
    Artist.all.sort_by{|art| art.name}.each.with_index(1) {|art, index| puts "#{index}. #{art.name}"}

  end

  def list_genres
  #  binding.pry
    Genre.all.sort_by{|gen| gen.name}.each.with_index(1){|gen, index| puts "#{index}. #{gen.name}"}
  end

  # def sort_and_search
  #   self.songs.sort_by {|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
  # end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    found_art = Artist.all.find {|art| art.name == artist_name}

    if found_art
      found_art.songs.sort_by {|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    found_genre = Genre.all.find {|gen| gen.name == genre_name}

    if found_genre
      found_genre.songs.sort_by {|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song

    puts "Which song number would you like to play?"
    #list_songs
    input = gets.chomp.to_i - 1
    #binding.pry
    if (0...Song.all.length).include?(input)
      #binding.pry
      puts "Playing #{Song.all.sort_by{|s|                 s.name}[input].name} by #{Song.all.sort_by{|s| s.name}[input].artist.name}"
    end
  end

end
