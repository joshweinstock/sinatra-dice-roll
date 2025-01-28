require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:elephant)
end

get("/dice/2/6")do
first_die = rand(1..6)
second_die = rand(1..6)
sum = first_die + second_die
@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
erb(:two_six, { :layout=>:wrapper})
end

get("/dice/2/10") do
  first_die=rand(1..10)
  second_die=rand(1..10)
  sum=first_die+second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_ten, {:layout => :wrapper })
end

get("/dice/2/20") do
  first_die = rand(1..20)
  second_die = rand(1..20)
  sum=first_die+second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_twenty, {:layout => :wrapper })
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum=first_die+second_die+third_die+fourth_die+fifth_die
  @outcome = "you rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die}, for a total of #{sum}."
  erb(:five_four, {:layout => :wrapper })
end