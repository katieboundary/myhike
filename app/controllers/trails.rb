require_relative '../../lib/trail_api_client.rb'
get '/trails' do
  erb :'trails/index'
  # testing
  # testing
end


post '/trails' do
  @client = TrailApiClient.new
  @api_response = @client.make_request({ "q[city_cont]" => params[:city] }).body
  # q[country_cont]
  # q[state_cont]
  erb :'trails/index'
end

# '/trails/results'
