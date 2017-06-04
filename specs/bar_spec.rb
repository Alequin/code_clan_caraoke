require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")
require_relative("../guest.rb")
require_relative("../consumable.rb")

class TestBar < Minitest::Test

  def setup
    @crisps = Consumable.new("crisps", :food, 3)
    @consumables = [
      Consumable.new("soda", :drink, 4),
      Consumable.new("juice", :drink, 5),
      Consumable.new("burger", :food, 5)
    ]
    @guest_1 = Guest.new("Bob", 100, @song_1)
    @bar = Bar.new(@consumables)
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
    assert_equal(@consumables, @bar.get_menu)
  end

  def test_sell_to_guest
    guest_money_pre_purchase = @guest_1.money
    @bar.sell_to_guest(@guest_1, @crisps)
    expected_guest_money = guest_money_pre_purchase - @crisps.cost
    assert_equal(expected_guest_money, @guest_1.money)
    expected_bar_profit = @crisps.cost
    assert_equal(expected_bar_profit, @bar.profit)
    assert(@guest_1.has_consumable?(@crisps))
  end

  def test_add_consumable
    @bar.add_consumable(@crisps)
    assert(@bar.consumable_available?(@crisps))
  end

  def test_remove_consumable
    menu = @bar.get_menu
    @bar.remove_consumable(menu[0])
    assert(!@bar.consumable_available?(menu[0]))
  end

  def test_consumable_available__true
    @bar.add_consumable(@crisps)
    assert(@bar.consumable_available?(@crisps))
  end

  def test_consumable_available__false
    assert(!@bar.consumable_available?(@crisps))
  end

end
