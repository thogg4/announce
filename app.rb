class Announce < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack
  assets do
    serve '/css', from: 'assets/css'

    css :main, [
     '/css/*.css'
    ]
    css_compression :sass
  end

  get '/' do
    @deliveries = Delivery.all
    slim :index
  end

  post '/deliveries/new' do
    Delivery.create(params[:delivery])
    redirect to('/')
  end

  get '/deliveries/:id' do
    @delivery = Delivery.find(params[:id])
    @emails = @delivery.emails
    slim :show
  end

  post '/deliveries/:id' do
    @delivery = Delivery.find(params[:id])
    @delivery.update_attributes(params[:delivery])

    redirect to("/deliveries/#{params[:id]}")
  end

  get '/deliveries/:id/send' do
    @delivery = Delivery.find(params[:id])

    if @delivery.active?
      @delivery.emails.each do |email|
        Pony.mail({
          to: email.email,
          subject: @delivery.subject,
          body: @delivery.message
        })
      end
    end

    redirect to('/')
  end

  post '/deliveries/:delivery_id/emails/new' do
    Email.create(params[:email])
    
    redirect to("/deliveries/#{params[:delivery_id]}")
  end

  post '/deliveries/:delivery_id/emails/:id' do
    @email = Email.find(params[:id])
    @email.update_attributes(params[:email])
    
    redirect to("/deliveries/#{params[:delivery_id]}")
  end

end
