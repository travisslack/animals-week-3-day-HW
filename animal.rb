require( 'pg' )

class Animal

  attr_accessor :name, :gender, :homeworld, :bounty_value
  attr_reader :id

  def initialize(option)
    # binding.pry
    @name = option['name'],
    @species = option['species']
    @homeworld = option['homeworld']
    @bounty_value = option['bounty_value'].to_i
    @id = option['id'].to_i if option['id']
  end

  def save()
    db = PG.connect( {dbname: 'animal_type', host: 'localhost'})
  sql = 
    "INSERT INTO animals
    (name, species, homeworld, bounty_value)
    VALUES
    ('#{@name}', '#{@species}', '#{@homeworld}', '#{@bounty_value}')
    RETURNING id;"
    @id = db.exec(sql)[0]["id"].to_i
    db.close
  end

  def update()
    db = PG.connect( {dbname: 'animal_type', host: 'localhost'})
    sql = 
    "UPDATE animals
    SET (name, species, homeworld, bounty_value) = 
    ('#{@name}', '#{@species}', '#{@homeworld}', '#{@bounty_value}')
    WHERE id = #{@id};"
    db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect( {dbname: 'animal_type', host: 'localhost'})
    sql = "DELETE FROM animal_type WHERE id = #{id}; "
    db.exec(sql)
    db.close
  end

  def self.find(id_input)
    db = PG.connect( { dbname: 'animal_type', host: 'localhost'})
    sql = "SELECT * FROM animals WHERE id = #{id_input};"
    all_species = db.exec(sql)
    db.close
    return all_species.map { |species| Animal.new( species ) } 
  end

  def self.delete_all()
    db = PG.connect( { dbname: 'animal_type', host: 'localhost' } )
    sql = "DELETE from animals"
    db.exec(sql)
    db.close
  end

end