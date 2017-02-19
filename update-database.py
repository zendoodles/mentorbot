import os
import subprocess
import re
import time

# make sure we are in the project directory
os.chdir('/home/ubuntu/mentorbot')

# call `git status`
cmd = ["git", "status"]
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
output = proc.stdout.read()

# check command output to see if database has changed
if re.search('modified:   bot-basicbot.sqlite', output):

  # Stage .sqlite file to be committed
  subprocess.call(["git", "add", "bot-basicbot.sqlite"])

  # Use current date and time in commit message
  commit_message = "Database upload on " + time.strftime("%c")
  subprocess.call(["git", "commit", "-m", commit_message])

  # Push changes to github.com
  subprocess.call(["git", "push"])
