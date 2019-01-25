TAG="hadoop-cluster"

build-hadoop-base:
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build base image"
	@ docker build -t sangwonl/hadoop-base:2.7.1 ./hadoop-base/

build.all: build-hadoop-base
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build all image"