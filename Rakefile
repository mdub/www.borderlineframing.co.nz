require 'rubygems'
require 'bundler/setup'

task "default" => "build"

desc "build the site"
task "build" do
  sh "pith -i src -o out build"
end

desc "build the site and rebuild as required"
task "serve" do
  sh "pith -i src -o out serve -p 9876"
end

task "browse" do
  Process.fork do
    sleep 0.5
    sh("open http://localhost:9876")
  end
end

desc "build the site"
task "dev" => ["browse", "serve"]
