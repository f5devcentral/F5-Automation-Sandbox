#!/usr/bin/env bash

set -x

COMMAND=(/bin/bash -c "sudo pip install -U sphinx ; make html")

: ${DOC_IMG:=f5devcentral/containthedocs:latest}

exec docker run --rm -t \
  -v $PWD:$PWD --workdir $PWD \
  ${DOCKER_RUN_ARGS} \
  -e "LOCAL_USER_ID=$(id -u)" \
  ${DOC_IMG} "${COMMAND[@]}"
