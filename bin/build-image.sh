image="dvc_test"
version="latest"


if [ $HOSTNAME = 'gpu-ext.oe165.ias.iosb.fraunhofer.de' ]; then
        echo "Building image for Podman for GPU server..."
        echo ""

	podman build -t $image:$version -f docker/Dockerfile .
else
	echo "Building image for Docker"
	echo ""
	
	#tryout image as described in INSTALL.md
	docker build -t $image:$version -f docker/Dockerfile .
	
	#FOR RUNNING WITH JUPYTER
	#docker build -t maskrcnn-benchmark-jupyter docker/docker-jupyter/

	#load and tag
	#docker load < image-name
	#docker tag e55008aabce9 image-name:version
fi