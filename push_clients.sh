#This file pulls the existing master from the clients repo
# 1st parameter -> release note
# bash push_clients.sh "Added support for additional place types in address details section."
# bash push_clients.sh "Fixed bug in tests in some clients."
#changed file
folder=clients

if [ ! -d "$folder" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "Directory doesn't exist";
  exit 1
fi

for d in $folder/* ; do
    cd $d
    LANG=${PWD##*/} 
    echo $LANG
    echo "Committing changes"
     # Adds the files in the local repository and stages them for commit.
    git add .
    # Commits the tracked changes and prepares them to be pushed to a remote repository. 
    git commit -m "$1"
    echo "Pushing"
    git push -f origin test-branch
    cd ..
    cd ..
done