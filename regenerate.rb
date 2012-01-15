root_path = "#{File.dirname(__FILE__)}"

puts "#{root_path}"

#system "cd #{root_path} && git pull origin develop"

#判断git版本是否改动
system "cd #{root_path} && jekyll"