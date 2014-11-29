configure :production, :development do
  ActiveRecord::Base.establish_connection({
    :adapter => 'postgresql',
    :host => ENV['POSTGRESQL_HOST'],
    :username => ENV['POSTGRESQL_USER'],
    :password => ENV['POSTGRESQL_PASS'],
    :database => ENV['POSTGRESQL_DB'],
    :encoding => 'utf8'
  })
end
