require("minitest/autorun")
require("minitest/rg")
require_relative("../consumable.rb")

class TestConsumable < Minitest::Test

  def setup
    @drink = Consumable.new("soda", 4)
  end

  def test_get_name
    assert_equal("soda", @drink.name)
  end

  def test_get_cost
    assert_equal(4, @drink.cost)
  end

end
