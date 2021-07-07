require 'bundler'

require_relative '../lib/concerns/findable'
# require_relative '../lib/concerns/memorable'
# require_relative '../lib/concerns/paramable'

# require_relative '../lib/song'
# require_relative '../lib/artist'
# require_relative '../lib/genre'
# require_relative '../lib/musicimporter'
# require_relative '../lib/musiclibrarycontroller'


Bundler.require

module Concerns
end

require_all 'lib'
