require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")
require_relative("../guest.rb")

class TestBar < Minitest::Test

  def setup
    @guest_1 = Guest.new("Bob", 100, @song_1)
    @bar = Bar.new([])
  end

  def test_get_profit
    assert_equal(0, @bar.profit)
    @bar.take_money(@guest_1, 10)
    assert_equal(10, @bar.profit)
  end

  def test_take_money
    expected_guest_money = @guest_1.money - 10
    @bar.take_money(@guest_1, 10)
    assert_equal(expected_guest_money, @guest_1.money)
    assert_equal(10, @bar.profit)
  end

  def test_get_menu

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
