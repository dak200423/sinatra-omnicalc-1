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
  @apr = params.fetch("users_apr").to_f
  @interest_rate = (@apr.to_f / 100)/12
  @present_value = params.fetch("users_principal").to_f
  @num_years = params.fetch("users_years").to_i
  @periods = @num_years * 12
  
  @numerator = @interest_rate * @present_value
  @denominator = 1 - ((1 + @interest_rate) ** (-1 * @periods))
  @result = @numerator / @denominator

erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end
