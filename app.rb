class Announce < Sinatra::Base

  get '/' do
    slim :index
  end

end
