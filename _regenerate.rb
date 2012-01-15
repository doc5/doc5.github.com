root_path = "#{File.dirname(__FILE__)}"
git_log = "#{root_path}/_logs/git.log"

#puts "#{root_path}"
#init
system "touch #{git_log}"

last_git_log_str = IO.read(git_log)

system "cd #{root_path} && git pull origin develop"
system "cd #{root_path} && git log -1 > #{git_log}"

latest_git_log_str = IO.read(git_log)

#判断git版本是否改动
if last_git_log_str != latest_git_log_str
  system "cd #{root_path} && jekyll"
end