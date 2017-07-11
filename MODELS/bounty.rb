class Bounty

  attr_reader :name, :bounty_value, :danger_level, :favourite_weapon

  def initialize( options )
    @name = options[:name]
    @bounty_value = options[:bounty_value]
    @danger_level = options[:danger_level]
    @favourite_weapon = options[:favourite_weapon]
    @id = options[:id].to_i if options[:id]
  end

end