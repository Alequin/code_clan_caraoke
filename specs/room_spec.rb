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

    @guest_1 = Guest.new("Bob", 100, @song_1)
    @guest_1 = Guest.new("Sally", 200, @song_2)

    @songs = [@song_1, @song_2, @song_3]
    @guests = [@guest_1, @guest_2]

    @room_1 = Room.new(@guests, @songs, 5, 20)
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

  def test_play_next_song
    assert_equal(@song_1.lyrics, @room_1.play_next_song())
    assert_equal(@song_2.lyrics, @room_1.play_next_song())
    assert_equal(@song_3.lyrics, @room_1.play_next_song())
    assert_equal(@song_1.lyrics, @room_1.play_next_song())
  end

  def test_play_random_song
    assert_equal(@song_1.lyrics, @room_1.play_random_song())
  end

end
