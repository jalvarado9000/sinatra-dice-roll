require "sinatra"

get("/howdy") do
return "Hello World"
end

get("/random") do
  lucky = rand(100)
  return "Your lucky number is: " + lucky.to_s
end 

=begin
get("/") do
  "
  <h1>Dice Roll</h1>
	
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end

=end

# /dice.rb
	
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  #the right side is to put everything with the same layout
  erb(:two_six, { :layout => :wrapper })
end


# /dice.rb

get("/dice/1/20") do
  @die = rand(1..20)

  @outcome = "You rolled a #{@die}."

  erb(:one_twenty)
end


get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
