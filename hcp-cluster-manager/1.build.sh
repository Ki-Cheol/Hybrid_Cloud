#!/bin/bash
docker_id="ketidevit2"
controller_name="hcp-cluster-manager"

export GO111MODULE=on
go mod vendor

go build -o build/_output/bin/$controller_name -gcflags all=-trimpath=`pwd` -asmflags all=-trimpath=`pwd`  -mod=vendor Hybrid_Cloud/$controller_name/src/main && \

docker build -t $docker_id/$controller_name:v0.0.1 build && \
docker push $docker_id/$controller_name:v0.0.1

#0.0.1 ->> 운용중이던 컨테이너
#0.0.3 ->> 테스트 컨테이너(제병)