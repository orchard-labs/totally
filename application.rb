require 'sinatra/base'

module TotallyOrchard
  class Application < Sinatra::Base
    get '/' do
      'hello world'
    end

    run! if app_file == $0
  end
end
