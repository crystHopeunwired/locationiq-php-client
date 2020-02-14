#This file pulls the existing master from the clients repo
# 1st parameter -> username
# 2nd parameter -> language (dir name of the client)
# 3rd parameter -> client folder
# bash pull_clients.sh arvind@unwiredlabs.com php path_to_php_client

if [ ! -d "$3" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "Directory doesn't exist";
  exit 1
fi


cd $3
git init
git config user.name $1

# Pulling master
echo "Pulling master"
git remote add origin https://github.com/crystHopeunwired/locationiq-$2-client.git
git fetch --all
git reset --hard origin/master
git pull origin master
cd ..
cd ..
