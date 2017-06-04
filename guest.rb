class Guest

  attr_reader :name, :money, :favourite_song

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
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

end
