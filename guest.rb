class Guest

  attr_reader :name, :money, :favourite_song

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
    @consumables = []
  end

  def increase_money_by(amount)
    @money += amount
  end

  def decrease_money_by(amount)
    @money -= amount
  end

  def cheer()
    return "Whoo!"
  end

  def sing(song)
    return song.lyrics
  end

  def sing_favourite_song()
    return sing(@favourite_song)
  end

  def is_favourite_song?(song)
    return @favourite_song == song
  end

  def add_consumable(consumable)
    @consumables.push(consumable)
  end

  def remove_consumable(consumable)
    @consumables.delete(consumable)
  end

  def has_consumable?(consumable)
    @consumables.include?(consumable)
  end

  def has_drink?()
    return has_consumable_type?(:drink)
  end

  def has_food?()
    has_consumable_type?(:food)
  end

  def has_consumable_type?(type)
    return @consumables.any?() {|consumable| consumable.type == type}
  end

end
