require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new")do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_square_root").to_f
  @the_result = @the_num ** (1/2.0)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @interest_rate = params.fetch("users_apr").to_f / (100/12)
  @periods = params.fetch("users_years").to_i * 12
  @numerator = @interest_rate
  @denominator = 1 - ((1 + @interest_rate) ** (-@periods))
  @result = @numerator / @denominator
end
