export PUSH_FLAG="--push"
export BUILD_FLAG="buildx build --platform linux/amd64"
#export TAG=2.0.2
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
