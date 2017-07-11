require('pg')
require('pry')

class Bounty

  attr_reader :name, :bounty_value, :danger_level, :favourite_weapon

  def initialize( options )
    @name = options[:name]
    @bounty_value = options[:bounty_value]
    @danger_level = options[:danger_level]
    @favourite_weapon = options[:favourite_weapon]
    @id = options[:id].to_i if options[:id]
  end

  def save()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = " INSERT INTO space_cowboys ( name, bounty_value, danger_level, favourite_weapon ) VALUES ( '#{@name}', '#{@bounty_value}', '#{@danger_level}', '#{@favourite_weapon}' ) RETURNING id"
    @id = db.exec(sql)[0]['id'].to_i
    db.close
  end

  def update()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = " UPDATE space_cowboys SET name = '#{@name}', bounty_value = '#{@bounty_value}', danger_level = '#{@danger_level}', favourite_weapon = '#{@favourite_weapon}' WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

end