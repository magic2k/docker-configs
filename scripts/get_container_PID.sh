#!/bin/bash
docker inspect --format '{{ .State.Pid }}' $1
