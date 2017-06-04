require("pry")

class Room

  attr_reader :capacity, :entry_fee, :room_number

  @@total_rooms = 0

  def initialize(songs, capacity, entry_fee)
    @guests = []
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee

    @@total_rooms += 1
    @room_number = @@total_rooms
    @current_song_index = 0
  end

  def Room.reset_total_rooms_counter()
    @@total_rooms = 0
  end

  def play_next_song()
    @current_song_index = 0 if @current_song_index >= @songs.length
    lyrics = @songs[@current_song_index].lyrics
    @current_song_index += 1 if @current_song_index < @songs.length
    return lyrics
  end

  def play_random_song()
    @current_song_index = rand(@songs.length)
    return @songs[@current_song_index]
  end

  def song_in_room?(song)
    return @songs.include?(song)
  end

  def number_of_guests()
    return @guests.length
  end

  def get_current_guests()
    return @guests
  end

  def check_in_guests(guests)
    @guests = guests
  end

  def remove_guests()
    guests = @guests
    @guests = []
    return guests
  end

  def space_for_guests?(guest)
    return (@guests.empty?()) && (guest.length <= @capacity)
  end

end
