Dir['./lib/tasks/**/*.rake'].each { |f| load f }
task :default => :spec

desc "Opens a console session [Development]"
task :irb do
  irb = ENV['IRB_PATH'] || 'irb'
  system "#{irb} -r./server.rb"
end

require 'rspec/core/rake_task'

desc "run specs"
RSpec::Core::RakeTask.new
