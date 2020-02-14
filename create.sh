#!/bin/bash
#Usage: bash create.sh arvind@unwiredlabs.com   ---> For all languages
#Usage: bash create.sh arvind@unwiredlabs.com php ---> For only PHP

SPEC=liq_api_spec_openapi3_v2_0_0.yaml
DIR=.
USER=$1
VERSION=2.0.0

# it is necessary to use the master snapshot to create a proper R and C# client
SW_VERSION=master
SW_VERSION=4.2.3
FILE=openapi-generator-cli-$SW_VERSION.jar

NAME=locationiq-client
GROUP=com.locationiq

# if the download doesn't work check for the latest version jar link at https://github.com/OpenAPITools/openapi-generator
if [[ ! -f $FILE ]]; then
  wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$SW_VERSION/openapi-generator-cli-$SW_VERSION.jar
  if [[ ! -f $FILE ]]; then
    curl https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$SW_VERSION/openapi-generator-cli-$SW_VERSION.jar -O openapi-generator-cli-$SW_VERSION.jar
  fi
fi


function create {
  
  LANG=$2
  CONFIG=""
  # extra params globally applicable for all languages to be used with generate command
  # --skip-validate-spec turns the validation off, it is done because parser throws some error for path parameters but YAML file has been validated externally and is correct.
  ADD_PARAMS="--skip-validate-spec"
  
  NAME=locationiq-$LANG-client

  case "$LANG" in
  clojure)
    ;;
  
  csharp)
    ;;
  
  dart)
    ;;
  
  go)
		# CONFIG="-t modules/swagger-codegen/src/main/resources/go"
		ADD_PARAMS=""
		;;
  
  haskell)
    ;;
	
  java)
		PKG="com.locationiq.client"
		CONFIG="--artifact-version $VERSION --api-package $PKG.api --model-package $PKG.model --artifact-id $NAME --group-id $GROUP --library okhttp-gson -DhideGenerationTimestamp=true"
		;;
  
  javascript)
		CONFIG="-t modules/swagger-codegen/src/main/resources/Javascript"
		;;

  kotlin)
    ;;
  
  objc)
    ADD_PARAMS="-DpodName=LocationIq"
    ;;
  
  perl)
    ;;

  php)
		CONFIG="--artifact-version $VERSION"
		;;

  python)
    ;;

  r)
		ADD_PARAMS=""
		;;
	
  ruby)
		CONFIG="-DgemName=$NAME -DmoduleName=LocationIQClient -DgemVersion=$VERSION"
		;;
	
	swift4)
		CONFIG="-DprojectName=LocationIQ"
		;;

  	*)
		;;
  esac

  # echo "create $LANG, config: $CONFIG, additional params: $ADD_PARAMS"
  CLIENTDIR="$DIR/clients/$LANG"
  rm -rf $CLIENTDIR
  mkdir $CLIENTDIR
  
  PULLSCRIPT="bash pull_clients.sh $1 $LANG $CLIENTDIR"
  $PULLSCRIPT

 
  echo "Deleting folders & files except git"
  shopt -s extglob
  IGNOREDIR="(.git)"
  rm -rf $CLIENTDIR/!$IGNOREDIR
  echo $CLIENTDIR/$IGNOREDIR
 
  SH="java -jar $FILE generate -i $SPEC -g $LANG $CONFIG -o $DIR/clients/$LANG $ADD_PARAMS -DpackageName=locationiq -DinvokerPackage=LocationIq --git-repo-id $NAME --git-user-id crystHopeunwired"
  echo $SH
  $SH
}

LANG=$2
if [[ "$LANG" != "" ]]; then
  create $1 $LANG
  exit 0
else
  echo "creating all"
  
  # the JS client is just too large and not recommended so use nodejs-server
  # create javascript -> nodejs-server
  
  create $1 clojure
  create $1 csharp
  create $1 dart
  create $1 go
  create $1 haskell
  create $1 kotlin
  create $1 java
  create $1 nodejs-express-server
  create $1 objc
  create $1 perl
  create $1 php
  create $1 python
  create $1 cpp-qt5-client
  create $1 r
  create $1 ruby
  create $1 rust
  create $1 scalaz
  create $1 swift4
fi