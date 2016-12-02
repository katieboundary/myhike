require 'unirest'
class TrailApiClient
  # These code snippets use an open-source library. http://unirest.io/ruby
  def make_request(params = nil)
    params ||= {
      'q[city_cont]' => "San Francisco",
      'radius' => 25,
    }
    response = Unirest.get(
      "https://trailapi-trailapi.p.mashape.com/",
      headers: {
        "X-Mashape-Key" => ENV['TRAIL_API_MASHAPE_KEY'],
        "Accept" => "text/json"
      },
      parameters: params
    )
  end

end
