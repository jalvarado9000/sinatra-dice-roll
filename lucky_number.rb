require "sinatra"

get("/howdy") do
return "Hello World"
end

get("/") do
  lucky = rand(100)
  return "Your lucky number is: " + lucky.to_s
end 
