class Song
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def artist=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song_parts = filename.split(" - ")
    song = song_parts[1]
    artist = song_parts[0]
    song_new = self.new(song)
    song
  end

end