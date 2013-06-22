require './server'

TotallyOrchard::Main.set :run, false

# for heroku
$stdout.sync = true

run TotallyOrchard::Main
