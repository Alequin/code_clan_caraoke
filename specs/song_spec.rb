require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class Test < Minitest::Test

  def setup
    @song_1_lyrics = "My daddy was workin' nine to five"
    @song_1 = Song.new("Rock’n’Roll Singer", "ACDC", @song_1_lyrics, 228)
  end

  def test_get_title
    assert_equal("Rock’n’Roll Singer", @song_1.title)
  end

  def test_get_artist
    assert_equal("ACDC", @song_1.artist)
  end

  def test_get_lyrics
    assert_equal(@song_1_lyrics, @song_1.lyrics)
  end

  def test_get_length__seconds
    assert_equal(228, @song_1.length_in_seconds)
  end

end
