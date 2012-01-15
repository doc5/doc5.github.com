root_path = "#{File.dirname(__FILE__)}"

log_path = "#{root_path}/_logs"
git_log = "#{log_path}/git.log"
deploy_log = "#{log_path}/deploy.log"

#puts "#{root_path}"
#init
system "touch #{git_log}"
system "touch #{deploy_log}"

last_git_log_str = IO.read(git_log)

system "cd #{root_path} && git pull origin develop"
system "cd #{root_path} && git log -1 > #{git_log}"
system "echo #{"#{Time.now}: git pull"} >> #{deploy_log}"

latest_git_log_str = IO.read(git_log)

#判断git版本是否改动
if last_git_log_str != latest_git_log_str
  system "cd #{root_path} && jekyll"  
  system "echo #{"#{Time.now}: reset jekyll"} >> #{deploy_log}"
end

system "echo #{"-" * 20} >> #{deploy_log}"