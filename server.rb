ENV['RACK_ENV'] ||= 'development'

require "bundler"
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'
require 'sinatra/assetpack'
require 'mongoid'

$:.unshift *Dir["./lib"]

module TotallyOrchard
  class Main < Sinatra::Base
    set :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }
    set :run, lambda { __FILE__ == $0 and not running? }
    set :views, root('app', 'views')

    enable :raise_errors, :sessions, :logging
    enable :show_exceptions  if development?

    enable :sessions
    set :session_secret, 'a8d89008fd6717580d596e493c8b37f29d83d03d'

    register Sinatra::AssetPack

    assets do
      serve '/js',     from: 'app/js'        # Default
      serve '/css',    from: 'app/css'       # Default
      serve '/images', from: 'app/images'    # Default

      # The second parameter defines where the compressed version will be served.
      # (Note: that parameter is optional, AssetPack will figure it out.)
      js :app, '/js/app.js', [
        '/js/vendor/jquery-1.10.1.js',
        '/js/vendor/bootstrap.js',
        '/js/lib/totally.js'
      ]

      css :application, '/css/application.css', [
        '/css/vendor/bootstrap.css',
        '/css/vendor/bootstrap-responsive.css',
        '/css/lib/totally.css'
      ]

      js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
      css_compression :simple   # :simple | :sass | :yui | :sqwish
    end
  end

  (Dir['./config/*.rb'].sort +
    Dir['./app/init/*.rb'].sort +
    Dir['./app/**/*.rb'].sort).uniq.each { |rb| require rb }

  Mongoid.load!("#{Main.root}/config/mongoid.yml")

  Main.set :port, ENV['PORT'].to_i if ENV['PORT']
  Main.run! if Main.run?
end
