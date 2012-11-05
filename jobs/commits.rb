require 'github_api'
require 'json'
# note to self -- response *has* to be JSON'd. That's the problem -- so figure out how to stuff author and comment into a JSON - follow the twitter.erb to see how to do it.

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
github = Github.new
commits = github.repos.commits.all 'jbfink', 'tvpeople'
lastmessage = commits[0].commit.message.to_json

  send_event('commits',  comments: lastmessage )
end
