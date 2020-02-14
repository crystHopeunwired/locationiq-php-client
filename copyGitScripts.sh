# 1st parameter -> version name

folder=clients/$1

if [ ! -d "$folder" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "Directory doesn't exist";
  exit 1
fi


cp gitpushscripts/git_push_haskell.sh $folder/haskell/git_push.sh
cp gitpushscripts/git_push_kotlin.sh $folder/kotlin/git_push.sh
cp gitpushscripts/git_push_nodejs.sh $folder/nodejs-server/git_push.sh
cp gitpushscripts/git_push_qt5cpp.sh $folder/qt5cpp/git_push.sh
