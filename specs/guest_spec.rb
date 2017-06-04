require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../consumable.rb")

class TestGuest < Minitest::Test

  def setup
    @drink = Consumable.new("soda", :drink, 4)
    @food = Consumable.new("crisps", :food, 2)

    @song_1_lyrics = "My daddy was workin' nine to five"
    @song_2_lyrics = "Somebody once told me the world is gonna roll me"
    @song_1 = Song.new("Rock’n’Roll Singer", "ACDC", @song_1_lyrics, 228)
    @song_2 = Song.new("All Star", "Smash Mouth", @song_2_lyrics, 237)
    @guest_1 = Guest.new("Bob", 100, @song_1)
  end

  def test_get_name
    assert_equal("Bob", @guest_1.name)
  end

  def test_get_money_amount
    assert_equal(100, @guest_1.money)
  end

  def test_get_fav_song
    assert_equal(@song_1, @guest_1.favourite_song)
  end

  def test_increase_money
    @guest_1.increase_money_by(100)
    assert_equal(200, @guest_1.money)
  end

  def test_decrease_money
    @guest_1.decrease_money_by(50)
    assert_equal(50, @guest_1.money)
  end

  def test_cheer
    assert_equal("Whoo!", @guest_1.cheer())
  end

  def test_sing
    assert_equal(@song_2.lyrics, @guest_1.sing(@song_2))
  end

  def test_sing_favourite
    expected = @guest_1.favourite_song.lyrics
    assert_equal(expected, @guest_1.sing_favourite_song())
  end

  def test_is_favourite_song
    assert_equal(true, @guest_1.is_favourite_song?(@song_1))
    assert_equal(false, @guest_1.is_favourite_song?(@song_2))
  end

  def test_add_to_consumables
    @guest_1.add_consumable(@drink)
    assert(@guest_1.has_consumable?(@drink))
  end

  def test_has_food__true
    @guest_1.add_consumable(@food)
    assert(@guest_1.has_food?())
  end

  def test_has_drink__true
    @guest_1.add_consumable(@drink)
    assert(@guest_1.has_drink?())
  end

  def test_has_food__false
    assert(!@guest_1.has_food?())
  end

  def test_has_drink__false
    assert(!@guest_1.has_drink?())
  end

  def test_has_specific_consumable__true
    @guest_1.add_consumable(@drink)
    assert(@guest_1.has_consumable?(@drink))
  end

  def test_has_specific_consumable__false
    assert(!@guest_1.has_consumable?(@drink))
  end

end
