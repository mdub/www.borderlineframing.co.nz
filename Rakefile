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
    sleep 2
    sh("open http://localhost:9876")
  end
end

desc "build the site"
task "dev" => ["browse", "serve"]

desc "upload to borderlineframing.co.nz"
task "publish" => "build" do

  require 'ftp_sync'
  BasicSocket.do_not_reverse_lookup = true

  username, password = ENV.fetch("BORDERLINE_FRAMING_CREDENTIALS").split(":")
  ftp_sync = FtpSync.new "ftp.borderlineframing.co.nz", username, password, :verbose => true
  ftp_sync.push_dir("out", "public_html")

end
