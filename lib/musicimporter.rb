class MusicImporter

    attr_accessor :path

    def initialize(filepath)
        self.path = filepath
    end

    def files
        Dir[@path+"/*.mp3"].map {|file| file.split("/").last}
    end

    def import         
       files.each {|filename| Song.create_from_filename(filename)}
    end  
end