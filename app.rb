require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    piggy = PigLatinizer.new
    @piglatin = piggy.to_pig_latin(params[:user_phrase])
    erb :results
  end
end
