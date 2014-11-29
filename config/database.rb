configure :production, :development do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end
