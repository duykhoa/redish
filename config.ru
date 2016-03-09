# cat config.ru
require "roda"

class App < Roda
  use Rack::Session::Cookie, :secret => ENV['SECRET']

  route do |r|
    r.root do
      r.redirect ENV['SUBDOMAIN']
    end
  end
end

run App
