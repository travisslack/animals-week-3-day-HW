require('pry')
require_relative('animal')

Animal.delete_all

creature1 = Animal.new ({
  'name' => 'Julius',
  'species' => 'Monkey',
  'homeworld' => 'America',
  'bounty_value' => '120'
})

creature2 = Animal.new ({
  'name' => 'Dixon',
  'species' => 'Cobra',
  'homeworld' => 'Africe',
  'bounty_value' => '300'
})

creature1.save()

creature1.name = "Dave"
creature1.update

Animal.find(1)




