require_relative("consumable.rb")

class Bar

  attr_reader :profit

  def initialize(consumables)
    @profit = 0
    @consumables = consumables
  end

  def Bar.get_bar()
    @@the_bar ||= Bar.new([Consumable.new("Soda", :drink, 4),
        Consumable.new("juice", :drink, 5),
        Consumable.new("crisps", :food, 2),
        Consumable.new("burger", :food, 6),
        Consumable.new("pizza", :food, 7)
      ])
  end

  def take_money(guest, amount)
    guest.decrease_money_by(amount)
    @profit += amount
  end

  def get_menu()
    @consumables.clone
  end

  def consumable_available?(consumable)
    @consumables.include?(consumable)
  end

  def add_consumable(consumable)
    @consumables.push(consumable)
  end

  def remove_consumable(consumable)
    @consumables.delete(consumable)
  end

  def sell_to_guest(guest, consumable)
    take_money(guest, consumable.cost)
    guest.add_consumable(consumable)
  end

end
