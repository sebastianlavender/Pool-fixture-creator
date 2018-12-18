#Asks for players
#Asks for number of tables
#Creates fixture
#Puts it out to a table


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "Please choose from the following options:"
  puts "1. Add players"
  puts "2. Choose number of tables"
  puts "3. See players in tornament"
end

def process(selection)
  case selection
    when "1"
      add_player
    when "2"
      tables_needed
    when "3"
      see_players
  end
end

#global variables
@players = []
@tables = 0

#adds players to the tornament
def add_player
  puts "Please enter the players for the tornament"
  puts "When finished press enter twice"
  
  while true do
    player = gets.chomp

    break if player.empty?
    @players << player
    puts "You now have #{@players.length} in the tornament"
  end
end

#choose the tables needed
def tables_needed
  puts "Please enter the tables required"
  input = gets.chomp
  @tables = input
end

def see_players
  @players.each { |player| puts player }
end



add_player
tables_needed
see_players
