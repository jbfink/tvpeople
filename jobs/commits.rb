require 'github_api'

github = Github.new
commits = github.repos.commits.all 'jbfink', 'tvpeople'

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('commits',  commits[0].commit.message )
end
