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

end
