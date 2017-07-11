require('pg')
require('pry')

class Bounty

  attr_accessor :name, :bounty_value, :danger_level, :favourite_weapon

  def initialize( options )
    @name = options[:name]
    @bounty_value = options[:bounty_value].to_i
    @danger_level = options[:danger_level]
    @favourite_weapon = options[:favourite_weapon]
    @id = options[:id].to_i if options[:id]
  end

  def save()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = " INSERT INTO bounties ( name, bounty_value, danger_level, favourite_weapon ) VALUES ( '#{@name}', '#{@bounty_value}', '#{@danger_level}', '#{@favourite_weapon}' ) RETURNING id"
    # binding.pry
    @id = db.exec(sql)[0]['id'].to_i
    db.close
  end

  def update()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = " UPDATE bounties SET name = '#{@name}', bounty_value = '#{@bounty_value}', danger_level = '#{@danger_level}', favourite_weapon = '#{@favourite_weapon}' WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = "DELETE FROM bounties WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def find(search_id)
    db = PG.connect( {dbname: 'space_cowboys', host: 'localhost'} )
    sql = "SELECT * FROM bounties WHERE id = #{search_id}"
    found = db.exec(sql)[0]
    db.close

    # return found.map {|record| Bounty.new( record )}

    return Bounty.new({
      id: found['id'].to_i,
      name: found['name'],
      bounty_value: found['bounty_value'].to_i,
      danger_level: found['danger_level'],
      favourite_weapon: found['favourite_weapon']
      })
  end

end