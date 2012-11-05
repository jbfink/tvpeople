require 'github_api'


# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
github = Github.new
commits = github.repos.commits.all 'jbfink', 'tvpeople'
lastmessage = commits[0].commit.message

  send_event('commits',  comments: lastmessage )
end
