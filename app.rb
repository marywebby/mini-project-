require "sinatra"
require "sinatra/reloader"

require "http"

get("/") do
  api_url = "https://api.artic.edu/api/v1/artworks"

  raw_data = HTTP.get(api_url) 
  
  raw_data_string = raw_data.to_s

  parsed_data = JSON.parse(raw_data_string)

  @artwork_ids = parsed_data["data"].map { |artwork| artwork["id"] }

  erb(:homepage)
end

get("/random_art") do 
  erb(:get_random_art_num)
end

get("/display_random_art") do
  @random_num = params.fetch("random_num").to_i

  erb(:display_random_art)
end
