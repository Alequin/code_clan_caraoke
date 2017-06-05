require("pry")

require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class TestRoom < Minitest::Test

  def setup
    Room.reset_total_rooms_counter()

    @song_1_lyrics = "My daddy was workin' nine to five"
    @song_2_lyrics = "Somebody once told me the world is gonna roll me"
    @song_3_lyrics = "Dovahkiin, Dovahkiin naal ok zin los vahriin"
    @song_1 = Song.new("Rock’n’Roll Singer", "ACDC", @song_1_lyrics, 228)
    @song_2 = Song.new("All Star", "Smash Mouth", @song_2_lyrics, 237)
    @song_3 = Song.new("Dragonborn (Skyrim Theme)", "The Elder Scrolls V: Skyrim (OGST)", @song_3_lyrics, 237)
    @empty_song = Song.new("","","",0)

    @guest_1 = Guest.new("Bob", 100, @song_1)
    @guest_2 = Guest.new("Sally", 200, @song_2)
    @guest_3 = Guest.new("Andrea", 100, @song_2)
    @guest_4 = Guest.new("Paul", 150, @song_3)
    @guest_5 = Guest.new("John", 150, @song_1)
    @guest_6 = Guest.new("Mia", 100, @song_3)

    @songs = [@song_1, @song_2, @song_3]
    @guests = [@guest_1, @guest_2]

    @room_1 = Room.new(@songs, 5, 20)
  end

  def test_get_capacity
    assert_equal(5, @room_1.capacity)
  end

  def test_get_entry_fee
    assert_equal(20, @room_1.entry_fee)
  end

  def test_get_room_number
    assert_equal(1, @room_1.room_number)
  end

  def test_get_current_song
    # until the first call to play next song
    # the method get_current_song returns nil
    assert_nil(@room_1.get_current_song())
    @room_1.play_next_song()
    assert_equal(@song_1, @room_1.get_current_song())
    @room_1.play_next_song()
    assert_equal(@song_2, @room_1.get_current_song())
  end

  def test_play_next_song
    @songs.cycle(2) do |song|
      assert_equal(song.lyrics, @room_1.play_next_song())
    end
  end

  def test_song_in_room__true
    assert_equal(true, @room_1.song_in_room?(@song_1))
  end

  def test_song_in_room__false
    assert_equal(false, @room_1.song_in_room?(@empty_song))
  end

  def test_add_song
    @room_1.add_song(@empty_song)
    result = @room_1.song_in_room?(@empty_song)
    assert_equal(true, result)
  end

  def test_remove_song
    @room_1.remove_song(@song_1)
    result = @room_1.song_in_room?(@song_1)
    assert_equal(false, result)
  end

  def test_number_of_guests
    assert_equal(0, @room_1.number_of_guests())
    @room_1.check_in_guests(@guests)
    assert_equal(2, @room_1.number_of_guests())
  end

  def test_check_in_guests__and__get_current_guests
    assert_equal([], @room_1.get_current_guests())
    @room_1.check_in_guests(@guests)
    assert_equal(@guests, @room_1.get_current_guests())
  end

  def test_all_guests_can_pay__true
    assert(@room_1.guests_can_pay?(@guests))
  end

  def test_all_guests_can_pay__false
    @guests.push(Guest.new("Fred", 5, @song_1))
    assert(!@room_1.guests_can_pay?(@guests))
  end

  def test_get_payment_from_guests
    expected_post_payment = @guests.map() {|guest| guest.money - @room_1.entry_fee}
    @room_1.get_payment_from_guests(@guests)
    @room_1.check_in_guests(@guests)
    room_guests = @room_1.get_current_guests()
    result_post_payment = room_guests.map() {|guest| guest.money}
    (@guests.length).times do |index|
      assert_equal(expected_post_payment[index], result_post_payment[index])
    end
  end

  def test_remove_guests
    @room_1.check_in_guests(@guests)
    guests = @room_1.remove_guests()
    assert_equal([], @room_1.get_current_guests())
    assert_equal(@guests, guests)
  end

  def test_space_for_guests__true
    assert_equal(true, @room_1.space_for_guests?(@guests))
  end

  def test_space_for_guests__false__already_in_use
    @room_1.check_in_guests(@guests)
    assert_equal(false, @room_1.space_for_guests?(@guests))
  end

  def test_space_for_guests__false__too_many_people_to_fit
    @guests.concat([@guest_3, @guest_4, @guest_5, @guest_6])
    assert_equal(false, @room_1.space_for_guests?(@guests))
  end

  def test_run_query_if_buy_consumable
    @room_1.check_in_guests(@guests)
    10.times(){@room_1.query_if_buy_consumables()}
  end

end
