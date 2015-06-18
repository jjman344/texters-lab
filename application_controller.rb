require 'bundler'
require 'pry'
require 'twilio-ruby'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base


  get '/' do
    erb :index
  end
  
  
  post '/' do
    @recipient = params[:recipient]
    @body = params[:choice]
    if @body == ""
      @body = params[:body]
    elsif @body == "R"
      random = ["What do you call a fake noodle? An impasta!",  "Meet me at the playground, I got the weed", "I have to tell you something really important", "OMG I cant believe that happened to sam"]
      @body = random[rand(random.length)]
    end
    send_sms(@recipient, @body)
    
    erb :results
  end
end