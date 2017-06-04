class Bar

  attr_reader :profit

  def initialize(consumables)
    @profit = 0
    @consumables = consumables
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
