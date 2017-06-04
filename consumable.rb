class Consumable

  attr_reader :name, :type, :cost

  def initialize(name, type, cost)
    @name = name
    @type = type
    @cost = cost
  end

end
