class MusicImporter
  
  attr_accessor :path , :files
  
def initialize(pathname)
  self.path = pathname
  self.files = []
  
end

def files
  Dir.entries(self.path).each{ 
    |f| 
  }
  
end
  
end