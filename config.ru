require "roda"

DOMAIN_NAMES = ["https://rnd1.herokuapp.com", "https://rnd2.herokuapp.com"]

class App < Roda
  use Rack::Session::Cookie, :secret => ENV['SECRET']

  route do |r|
    r.root do
      r.redirect url(Time.now.hour) + "?" + env['QUERY_STRING']
    end
  end

  def url(hour)
    hour > 12 ? DOMAIN_NAMES[0] : DOMAIN_NAMES[1]
  end
end

run App
