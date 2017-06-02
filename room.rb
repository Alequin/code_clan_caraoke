class Room

  @@total_rooms = 0

  def initialize(guests, songs, capacity, entry_fee)
    @guests = guests
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee

    @@total_rooms += 1
    @room_number = @@total_rooms
    @current_song_index = 0
  end

end
