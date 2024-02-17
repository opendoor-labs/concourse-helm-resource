# Note ... this is just a one off script
# the building of this script should be moved to CiCd
export PUSH_FLAG="--push"
export BUILD_FLAG="buildx build --platform linux/amd64"
#export TAG=2.18.0
export TAG=dev
export IMAGE=opendoor/concourse-helm-resource
if [[ "$1" == "local" ]]
then
	PUSH_FLAG=""
	BUILD_FLAG="build"
fi
# docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
echo $BUILD_FLAG
echo $PUSH_FLAG
docker $BUILD_FLAG -t $IMAGE:$TAG . $PUSH_FLAG
echo Built $IMAGE:$TAG
