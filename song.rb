class Song

  attr_reader :title, :artist, :lyrics, :length_in_seconds

  def initialize(title, artist, lyrics, length_in_seconds)
    @title = title
    @artist = artist
    @lyrics = lyrics
    @length_in_seconds = length_in_seconds
  end

end
