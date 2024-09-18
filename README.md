### Required Packeages:
- jq (https://jqlang.github.io/jq/). On Linux/ Mac easiest is to install Homebrew package manager and install JQ from there https://formulae.brew.sh/formula/jq

### How to run:
- download/ pull the code in the repo to appropriate directory on your local machine. 
- availability.sh is the script that CRON job needs to be configured against to run on the 15th and 45th minute of every hour
- the list of tenants can be modified in this file use a local text editor
- ensure shell scripts are executable by executing the change modifier command 'chmod +x availability.sh' and 'chmod +x venue-availability-json.sh' and 'chmod +x venue-availability-csv.sh'. The json and csv scripts do the same thing but just render different outputs.

### Gotchas:
- Script was only tested on Mac OS - Linux should also work, but might need to tweak on or two of the shell commands. For example on Mac date manipualtion is done with `date -v` but on Linux it is `date -d`

