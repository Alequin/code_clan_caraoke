require_relative("bar.rb")

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
    @current_song_index = -1

    @bar = Bar.get_bar()
  end

  def Room.reset_total_rooms_counter()
    @@total_rooms = 0
  end

  def get_current_song()
    return nil if (@current_song_index < 0)
    return @songs[@current_song_index]
  end

  def play_next_song()
    @current_song_index += 1 if @current_song_index < @songs.length
    @current_song_index = 0 if @current_song_index >= @songs.length
    lyrics = @songs[@current_song_index].lyrics
    return lyrics
  end

  def play_random_song()
    @current_song_index = rand(@songs.length)
    return @songs[@current_song_index]
  end

  def song_in_room?(song)
    return @songs.include?(song)
  end

  def add_song(song)
    @songs.push(song)
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def number_of_guests()
    return @guests.length
  end

  def get_current_guests()
    return @guests
  end

  def guests_can_pay?(guests)
    return !guests.any?(){|guest| guest.money <= @entry_fee}
  end

  def get_payment_from_guests(guests)
    guests.each do |guest|
      guest.decrease_money_by(entry_fee)
    end
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

  def query_if_buy_consumables()
    menu = @bar.get_menu()
    @guests.each() do |guest|
      if(guest.buy_consumable?())
        items_available = menu.find_all() {|item| item.cost <= guest.money}
        next if (items_available.empty?())
        @bar.sell_to_guest(guest, items_available.sample)
      end
    end
  end

end
