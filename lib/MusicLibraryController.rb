class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call 
    input = nil until input == "exit"
    input = gets.chomp
    puts "Welcome to your music library!"

    puts "To list all of your songs, enter 'list songs'."
    if input == "list songs"
      list_songs
  end
  puts "To list all of the artists in your library, enter 'list artists'."
  if input == "list artists"
    list_artists
  end
  puts "To list all of the genres in your library, enter 'list genres'."
  if input == "list genres"
    list_genres
  end
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  if input == "list artist"
    list_songs_by_artist
  end
  puts "To list all of the genres by a particular artist, enter 'list genre'."
  if input == "list genre"
    list_songs_by_genre
  end
  puts "To play a song, enter 'play song'."
  if input == "play song"
    play_song
  end
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  end

  def list_songs 
    Song.all.sort{ |a, b| a.name <=> b.name}.each_with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
  end
end
  
  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name}.each_with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
  end
end
  
  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name}.each_with_index(1) do |genre, index|
      puts "#{index}.#{genre.name}"
  end
end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artists = gets.chomp 
    if artist = Artist.find_by_name(artist)
      sorted_songs = artist.songs.sort_by{ |song| song.name}
      sorted_genres.each_with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genres = gets.chomp 
    if genre = Genre.find_by_name(genre)
      sorted_genres = genre.songs.sort_by{ |song| song.name}
      sorted_genres.each_with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song would you like to play?"
    input = gets.chomp.to_i 
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name}[input - 1]
      if song 
        puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
end