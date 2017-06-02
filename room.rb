class Room

  def initialize(guests, songs, capacity, entry_fee)
    @guests = guests
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee

    @@door_number += 1
    @current_song_index = 0
  end

end
