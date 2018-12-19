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
  puts "4. See amount of tables"
  puts "5. Remove player from tornament"
  puts "6. Create fixture list"
  puts "7. Import players from file"
  puts "8. Save players to file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      add_player
    when "2"
      tables_needed
    when "3"
      see_players
    when "4"
      see_table_amount
    when "5"
      remove_player
    when "6"
      fixture_creator
    when "7"
      import_players
    when "8"
      save_players
    when "9"
      exit
  end
end

#global variables
@players = []
@tables = 0
@fixture_list = []

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

def see_table_amount
  puts "You currently have #{@tables} tables selected"
end

def remove_player
  puts "Please enter the player you would like to remove"
  input = gets.chomp
  @players.each do |player|
    if player == input
      @players.delete(player)
    end
  end
end

def fixture_creator

  @players.each_with_index do |player, index|
    count = index + 1
    until count == @players.length
    @fixture_list << player
    @fixture_list << @players[count]
    count +=1
    end
  end
  print @fixture_list.each_slice(2).to_a
end

def import_players
  file = File.open("players.csv", "r")
  file.readlines.each do |line|
    @players << line.chomp
  end
end

def save_players
  file = File.open("players.csv", "w")
  @players.each do |player|
    file.puts player
  end
end

interactive_menu
