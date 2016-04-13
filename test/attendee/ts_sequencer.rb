# encoding: utf-8

require_relative '../test_helper'

class TestAttendeeSequencer < AttendeeTestCase

  def test_basic
    meet({}, [
      # AS
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      # AK
      wd('Der|IDF', 'der|w'),
      wd('schöne|IDF', 'schön|a'),
      wd('Sonnenuntergang|COM', 'sonnenuntergang|k', 'sonne|s+', 'untergang|s+'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # AS
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      wd('sonne, hell|SEQ', 'sonne, hell|q'),
      # AK
      wd('Der|IDF', 'der|w'),
      wd('schöne|IDF', 'schön|a'),
      wd('Sonnenuntergang|COM', 'sonnenuntergang|k', 'sonne|s+', 'untergang|s+'),
      wd('sonnenuntergang, schön|SEQ', 'sonnenuntergang, schön|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_many_permutations
    meet({}, [
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('cold|IDF', 'cold|s', 'cold|a'),
      wd('hot|IDF', 'hot|a'),
      wd('hot|IDF', 'hot|a'),
      wd('water|IDF', 'water|s', 'water|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('dry|IDF', 'dry|s', 'dry|a', 'dry|v'),
      wd('weather|IDF', 'weather|s', 'weather|v'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('winter|IDF', 'winter|s', 'winter|v'),
      wd('cool|IDF', 'cool|s', 'cool|a', 'cool|v'),
      wd('fruit|IDF', 'fruit|s', 'fruit|v'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('food|IDF', 'food|s'),
      wd('juice|IDF', 'juice|s', 'juice|v'),
      wd('flower|IDF', 'flower|s', 'flower|v'),
      wd('fresh|IDF', 'fresh|s', 'fresh|a'),
      wd('fish|IDF', 'fish|s', 'fish|a', 'fish|v'),
      wd('tree|IDF', 'tree|s', 'tree|v'),
      wd('meat|IDF', 'meat|s'),
      wd('salad|IDF', 'salad|s'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('leaves|IDF', 'leave|s', 'leaf|s', 'leave|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('colour|IDF', 'colour|s', 'colour|v'),
      wd('grey|IDF', 'grey|s'),
      wd('tobacco|IDF', 'tobacco|s'),
      wd('advertising|IDF', 'advertising|e'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('smoke|IDF', 'smoke|s', 'smoke|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('ban|IDF', 'ban|s'),
      wd('coal|IDF', 'coal|s'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('import|IDF', 'import|s', 'import|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('textile|IDF', 'textile|s'),
      wd('whiskey|IDF', 'whiskey|s'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('whisky|IDF', 'whisky|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('cold|IDF', 'cold|s', 'cold|a'),
      wd('hot|IDF', 'hot|a'),
      wd('hot|IDF', 'hot|a'),
      wd('water|IDF', 'water|s', 'water|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('dry|IDF', 'dry|s', 'dry|a', 'dry|v'),
      wd('weather|IDF', 'weather|s', 'weather|v'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('winter|IDF', 'winter|s', 'winter|v'),
      wd('cool|IDF', 'cool|s', 'cool|a', 'cool|v'),
      wd('fruit|IDF', 'fruit|s', 'fruit|v'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('food|IDF', 'food|s'),
      wd('juice|IDF', 'juice|s', 'juice|v'),
      wd('flower|IDF', 'flower|s', 'flower|v'),
      wd('fresh|IDF', 'fresh|s', 'fresh|a'),
      wd('fish|IDF', 'fish|s', 'fish|a', 'fish|v'),
      wd('tree|IDF', 'tree|s', 'tree|v'),
      wd('meat|IDF', 'meat|s'),
      wd('salad|IDF', 'salad|s'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('leaves|IDF', 'leave|s', 'leaf|s', 'leave|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('colour|IDF', 'colour|s', 'colour|v'),
      wd('grey|IDF', 'grey|s'),
      wd('tobacco|IDF', 'tobacco|s'),
      wd('advertising|IDF', 'advertising|e'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('smoke|IDF', 'smoke|s', 'smoke|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('ban|IDF', 'ban|s'),
      wd('coal|IDF', 'coal|s'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('import|IDF', 'import|s', 'import|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('textile|IDF', 'textile|s'),
      wd('whiskey|IDF', 'whiskey|s'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('whisky|IDF', 'whisky|s'),
      wd('water, hot|SEQ', 'water, hot|q'),
      wd('dry, warm|SEQ', 'dry, warm|q'),
      wd('water, hot hot|SEQ', 'water, hot hot|q'),
      wd('dry, warm warm|SEQ', 'dry, warm warm|q'),
      wd('colour, yellow|SEQ', 'colour, yellow|q'),
      wd('leave, white|SEQ', 'leave, white|q'),
      wd('white, yellow|SEQ', 'white, yellow|q'),
      wd('leave, yellow white|SEQ', 'leave, yellow white|q'),
      wd('yellow, blue|SEQ', 'yellow, blue|q'),
      wd('white, blue yellow|SEQ', 'white, blue yellow|q'),
      wd('blue, blue|SEQ', 'blue, blue|q'),
      wd('yellow, blue blue|SEQ', 'yellow, blue blue|q'),
      wd('blue, red|SEQ', 'blue, red|q'),
      wd('blue, red blue|SEQ', 'blue, red blue|q'),
      wd('red, red|SEQ', 'red, red|q'),
      wd('blue, red red|SEQ', 'blue, red red|q'),
      wd('red, green|SEQ', 'red, green|q'),
      wd('red, green red|SEQ', 'red, green red|q'),
      wd('green, vegetable|SEQ', 'green, vegetable|q'),
      wd('red, vegetable green|SEQ', 'red, vegetable green|q'),
      wd('tree, fish|SEQ', 'tree, fish|q'),
      wd('fish, fresh|SEQ', 'fish, fresh|q'),
      wd('tree, fresh fish|SEQ', 'tree, fresh fish|q'),
      wd('food, vegetable|SEQ', 'food, vegetable|q'),
      wd('fruit, cool|SEQ', 'fruit, cool|q'),
      wd('weather, dry|SEQ', 'weather, dry|q'),
      wd('weather, warm dry|SEQ', 'weather, warm dry|q'),
      wd('cold, white|SEQ', 'cold, white|q'),
      wd('white, green|SEQ', 'white, green|q'),
      wd('cold, green white|SEQ', 'cold, green white|q'),
      wd('green, yellow|SEQ', 'green, yellow|q'),
      wd('white, yellow green|SEQ', 'white, yellow green|q'),
      wd('yellow, white|SEQ', 'yellow, white|q'),
      wd('green, white yellow|SEQ', 'green, white yellow|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_many_permutations_regex
    meet({ 'sequences' => [['A[SK]', '2, 1'], ['AA[SK]', '3, 1 2']] }, [
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('cold|IDF', 'cold|s', 'cold|a'),
      wd('hot|IDF', 'hot|a'),
      wd('hot|IDF', 'hot|a'),
      wd('water|IDF', 'water|s', 'water|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('dry|IDF', 'dry|s', 'dry|a', 'dry|v'),
      wd('weather|IDF', 'weather|s', 'weather|v'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('winter|IDF', 'winter|s', 'winter|v'),
      wd('cool|IDF', 'cool|s', 'cool|a', 'cool|v'),
      wd('fruit|IDF', 'fruit|s', 'fruit|v'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('food|IDF', 'food|s'),
      wd('juice|IDF', 'juice|s', 'juice|v'),
      wd('flower|IDF', 'flower|s', 'flower|v'),
      wd('fresh|IDF', 'fresh|s', 'fresh|a'),
      wd('fish|IDF', 'fish|s', 'fish|a', 'fish|v'),
      wd('tree|IDF', 'tree|s', 'tree|v'),
      wd('meat|IDF', 'meat|s'),
      wd('salad|IDF', 'salad|s'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('leaves|IDF', 'leave|s', 'leaf|s', 'leave|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('colour|IDF', 'colour|s', 'colour|v'),
      wd('grey|IDF', 'grey|s'),
      wd('tobacco|IDF', 'tobacco|s'),
      wd('advertising|IDF', 'advertising|e'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('smoke|IDF', 'smoke|s', 'smoke|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('ban|IDF', 'ban|s'),
      wd('coal|IDF', 'coal|s'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('import|IDF', 'import|s', 'import|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('textile|IDF', 'textile|s'),
      wd('whiskey|IDF', 'whiskey|s'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('whisky|IDF', 'whisky|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('cold|IDF', 'cold|s', 'cold|a'),
      wd('hot|IDF', 'hot|a'),
      wd('hot|IDF', 'hot|a'),
      wd('water|IDF', 'water|s', 'water|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('warm|IDF', 'warm|a', 'warm|v'),
      wd('dry|IDF', 'dry|s', 'dry|a', 'dry|v'),
      wd('weather|IDF', 'weather|s', 'weather|v'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('winter|IDF', 'winter|s', 'winter|v'),
      wd('cool|IDF', 'cool|s', 'cool|a', 'cool|v'),
      wd('fruit|IDF', 'fruit|s', 'fruit|v'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('food|IDF', 'food|s'),
      wd('juice|IDF', 'juice|s', 'juice|v'),
      wd('flower|IDF', 'flower|s', 'flower|v'),
      wd('fresh|IDF', 'fresh|s', 'fresh|a'),
      wd('fish|IDF', 'fish|s', 'fish|a', 'fish|v'),
      wd('tree|IDF', 'tree|s', 'tree|v'),
      wd('meat|IDF', 'meat|s'),
      wd('salad|IDF', 'salad|s'),
      wd('vegetable|IDF', 'vegetable|s', 'vegetable|a'),
      wd('green|IDF', 'green|s', 'green|a', 'green|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('red|IDF', 'red|s', 'red|a', 'red|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('blue|IDF', 'blue|s', 'blue|a', 'blue|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('white|IDF', 'white|s', 'white|a', 'white|v'),
      wd('leaves|IDF', 'leave|s', 'leaf|s', 'leave|v'),
      wd('yellow|IDF', 'yellow|s', 'yellow|a', 'yellow|v'),
      wd('colour|IDF', 'colour|s', 'colour|v'),
      wd('grey|IDF', 'grey|s'),
      wd('tobacco|IDF', 'tobacco|s'),
      wd('advertising|IDF', 'advertising|e'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('smoke|IDF', 'smoke|s', 'smoke|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('ban|IDF', 'ban|s'),
      wd('coal|IDF', 'coal|s'),
      wd('cigarette|IDF', 'cigarette|s'),
      wd('import|IDF', 'import|s', 'import|v'),
      wd('alcohol|IDF', 'alcohol|s'),
      wd('textile|IDF', 'textile|s'),
      wd('whiskey|IDF', 'whiskey|s'),
      wd('drink|IDF', 'drink|s', 'drink|v'),
      wd('whisky|IDF', 'whisky|s'),
      wd('water, hot|SEQ', 'water, hot|q'),
      wd('dry, warm|SEQ', 'dry, warm|q'),
      wd('water, hot hot|SEQ', 'water, hot hot|q'),
      wd('dry, warm warm|SEQ', 'dry, warm warm|q'),
      wd('colour, yellow|SEQ', 'colour, yellow|q'),
      wd('leave, white|SEQ', 'leave, white|q'),
      wd('white, yellow|SEQ', 'white, yellow|q'),
      wd('leave, yellow white|SEQ', 'leave, yellow white|q'),
      wd('yellow, blue|SEQ', 'yellow, blue|q'),
      wd('white, blue yellow|SEQ', 'white, blue yellow|q'),
      wd('blue, blue|SEQ', 'blue, blue|q'),
      wd('yellow, blue blue|SEQ', 'yellow, blue blue|q'),
      wd('blue, red|SEQ', 'blue, red|q'),
      wd('blue, red blue|SEQ', 'blue, red blue|q'),
      wd('red, red|SEQ', 'red, red|q'),
      wd('blue, red red|SEQ', 'blue, red red|q'),
      wd('red, green|SEQ', 'red, green|q'),
      wd('red, green red|SEQ', 'red, green red|q'),
      wd('green, vegetable|SEQ', 'green, vegetable|q'),
      wd('red, vegetable green|SEQ', 'red, vegetable green|q'),
      wd('tree, fish|SEQ', 'tree, fish|q'),
      wd('fish, fresh|SEQ', 'fish, fresh|q'),
      wd('tree, fresh fish|SEQ', 'tree, fresh fish|q'),
      wd('food, vegetable|SEQ', 'food, vegetable|q'),
      wd('fruit, cool|SEQ', 'fruit, cool|q'),
      wd('weather, dry|SEQ', 'weather, dry|q'),
      wd('weather, warm dry|SEQ', 'weather, warm dry|q'),
      wd('cold, white|SEQ', 'cold, white|q'),
      wd('white, green|SEQ', 'white, green|q'),
      wd('cold, green white|SEQ', 'cold, green white|q'),
      wd('green, yellow|SEQ', 'green, yellow|q'),
      wd('white, yellow green|SEQ', 'white, yellow green|q'),
      wd('yellow, white|SEQ', 'yellow, white|q'),
      wd('green, white yellow|SEQ', 'green, white yellow|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_param
    meet({ 'sequences' => [['SS', '1 2'], ['SSS', '1 2 3']] }, [
      # (AS)
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      # SS + SS + SSS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      # SS
      wd('Der|IDF', 'der|w'),
      wd('Sonne|IDF', 'sonne|s'),
      wd('Untergang|IDF', 'untergang|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # (AS)
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      # SS + SS + SSS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      wd('gott turm|SEQ', 'gott turm|q'),
      wd('abbild gott turm|SEQ', 'abbild gott turm|q'),
      # SS
      wd('Der|IDF', 'der|w'),
      wd('Sonne|IDF', 'sonne|s'),
      wd('Untergang|IDF', 'untergang|s'),
      wd('sonne untergang|SEQ', 'sonne untergang|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_multi
    meet({ 'sequences' => [['MS', '1 2']] }, [
      # MS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gottes turm|SEQ', 'abbild gottes turm|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
    meet({ 'sequences' => [['MS', '1 2'], ['SS', '1 2'], ['SSS', '1 2 3']] }, [
      # MS + SS + SS + SSS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS + SS + SS + SSS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gottes turm|SEQ', 'abbild gottes turm|q'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      wd('gott turm|SEQ', 'gott turm|q'),
      wd('abbild gott turm|SEQ', 'abbild gott turm|q'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_regex
    meet({ 'sequences' => [['[MS]S', '1 2']] }, [
      # MS + SS + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS + SS + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gottes turm|SEQ', 'abbild gottes turm|q'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      wd('gott turm|SEQ', 'gott turm|q'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_regex_none
    meet({ 'sequences' => ['..'] }, [
      # (MS + SS + SS)
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # (MS + SS + SS)
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_regex_comm
    meet({ 'sequences' => ['(?#MS)..'] }, [  # = [MS][MS]
      # MS + SS + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS + SS + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gottes turm|SEQ', 'abbild gottes turm|q'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      wd('gott turm|SEQ', 'gott turm|q'),
      # SS
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('abbild gott|SEQ', 'abbild gott|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_regex_quan
    meet({ 'sequences' => ['[MS]S+'] }, [
      # MS + SSS + (SS) + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS + SSS + (SS) + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('abbild gottes turm|SEQ', 'abbild gottes turm|q'),
      wd('abbild gott turm|SEQ', 'abbild gott turm|q'),
      #wd('abbild gott|SEQ', 'abbild gott|q'),  # FIXME
      wd('gott turm|SEQ', 'gott turm|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_regex_form
    meet({ 'sequences' => [['[MS]S+', '^']] }, [
      # MS + SSS + (SS) + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # MS + SSS + (SS) + SS
      wd('Der|IDF', 'der|w'),
      wd('Abbild Gottes|MUL', 'abbild gottes|m'),
      wd('Abbild|IDF', 'abbild|s'),
      wd('Gottes|IDF', 'gott|s'),
      wd('Turm|IDF', 'turm|s'),
      tk('.|PUNC'),
      wd('ms:abbild gottes^turm|SEQ', 'ms:abbild gottes^turm|q'),
      wd('sss:abbild^gott^turm|SEQ', 'sss:abbild^gott^turm|q'),
      #wd('ss:abbild^gott|SEQ', 'ss:abbild^gott|q'),  # FIXME
      wd('ss:gott^turm|SEQ', 'ss:gott^turm|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_match
    meet({ 'sequences' => [['WA', '1 2 (0)'], ['A[SK]', '0: 2, 1']] }, [
      # WA + AS
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      # WA + AK
      wd('Der|IDF', 'der|w'),
      wd('schöne|IDF', 'schön|a'),
      wd('Sonnenuntergang|COM', 'sonnenuntergang|k', 'sonne|s+', 'untergang|s+'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      # WA + AS
      wd('Die|IDF', 'die|w'),
      wd('helle|IDF', 'hell|a'),
      wd('Sonne|IDF', 'sonne|s'),
      tk('.|PUNC'),
      wd('die hell (wa)|SEQ', 'die hell (wa)|q'),
      wd('as: sonne, hell|SEQ', 'as: sonne, hell|q'),
      # WA + AK
      wd('Der|IDF', 'der|w'),
      wd('schöne|IDF', 'schön|a'),
      wd('Sonnenuntergang|COM', 'sonnenuntergang|k', 'sonne|s+', 'untergang|s+'),
      wd('der schön (wa)|SEQ', 'der schön (wa)|q'),
      wd('ak: sonnenuntergang, schön|SEQ', 'ak: sonnenuntergang, schön|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

  def test_nums
    meet({ 'sequences' => [['0SS', '1 2 3'], ['S0', '1 2']] }, [
      tk('3|NUMS'),
      wd('body|IDF', 'body|s'),
      wd('problem|IDF', 'problem|s'),
      tk('.|PUNC'),
      wd('area|IDF', 'area|s'),
      tk('51|NUMS'),
      ai('EOF|'),
      ai('EOT|')
    ], [
      tk('3|NUMS'),
      wd('body|IDF', 'body|s'),
      wd('problem|IDF', 'problem|s'),
      tk('.|PUNC'),
      wd('3 body problem|SEQ', '3 body problem|q'),
      wd('area|IDF', 'area|s'),
      tk('51|NUMS'),
      wd('area 51|SEQ', 'area 51|q'),
      ai('EOF|'),
      ai('EOT|')
    ])
  end

end
