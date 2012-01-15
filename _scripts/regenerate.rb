root_path = "#{Dir.pwd}"
environment = "develop"

#system "ls #{root_path}"
system "git pull origin #{environment}"
system "jekyll"