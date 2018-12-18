#Asks for players
#Asks for number of tables
#Creates fixture
#Puts it out to a table

puts "Please enter the players for the tornament"
puts "When finished press enter twice"

#global variables
@players = []
@tables = 0

#adds players to the tornament
def add_player
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

add_player
tables_needed
