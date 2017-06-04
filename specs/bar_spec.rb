require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")
require_relative("../guest.rb")

class TestBar < Minitest::Test

  def setup
    @guest_1 = Guest.new("Bob", 100, @song_1)
    @bar = Bar.new
  end

  def test_get_profit

  end

  def test_get_menu

  end

  def test_take_money

  end

  def test_sell_to_guest

  end

  def test_add_consumable

  end

  def test_remove_consumable

  end

  def test_consumable_available

  end

end
