require 'bundler'

Bundler.require

Pony.options = {
  from: 'thogg4@gmail.com',
  via: :smtp,
  via_options: {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: ENV['email_username'],
    password: ENV['email_password'],
    authentication: :plain,
    domain: 'gmail.com'
  }
}

require './config/database'
require './models/delivery'
require './models/email'

require './app'
run Announce
