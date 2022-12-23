image="dvc_test"
version="latest"

if [ $HOSTNAME = 'gpu-ext.oe165.ias.iosb.fraunhofer.de' ]; then
	echo "Starting container via Podman for GPU server..."
	echo ""

	# GPU Server (gpu-ext):
	mountdir="/home/bostil/XAI/centermask/mount-dir"
	
	#--ipc=host solves problems with shared memory (RuntimeError: cannot write to torch...)
	podman run --ipc=host -it --hooks-dir=/usr/share/containers/oci/hooks.d/ --name $image --rm -v $mountdir:/app:Z -w /app --security-opt=no-new-privileges --cap-drop=ALL --security-opt label=type:nvidia_container_t $image:$version bash

else
	echo "Starting container for local usage..."
	echo ""

	#add your path to the mount-dir
	mountdir="/home/muealm/WSL-Workspace/Python/data-version-control/mount-dir"
	
	docker run -it -p 5000:5000 --name $image --rm -v $mountdir:/app $image:$version bash
	
	#FOR RUNNING WITH JUPYTER
	#winpty docker run -td -p 8888:8888 -e PASSWORD=<password> -v <host-dir>:<container-dir> maskrcnn-benchmark-jupyter
fi