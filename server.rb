ENV['RACK_ENV'] ||= 'development'

require "bundler"
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'

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
  end

  (Dir['./config/*.rb'].sort +
    Dir['./app/init/*.rb'].sort +
    Dir['./app/**/*.rb'].sort).uniq.each { |rb| require rb }

  Main.set :port, ENV['PORT'].to_i if ENV['PORT']
  Main.run! if Main.run?
end
