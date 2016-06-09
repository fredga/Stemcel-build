#!/usr/bin/env bash

base_dir=$(readlink -nf $(dirname $0)/../..)
source $base_dir/lib/prelude_apply.bash


NFS_SERVER=nfs01.cloud.
NFS_SERVER_PATH=
CURL_COMMAND=
TAR_COMMAND=
TMP_XSTOOL=


#upload script and install
if [ ! -d "${TMP_XSTOOLS}" ];then
echo "Create temp directory";
mkdir ${TMP_XSTOOLS}


${CURL_COMMAND} ${NFS_SERVER}${NFS_SERVER_PATH}${XENTOOLS} |${TAR_COMMAND} -xvf -C ${TMP_XSTOOLS}

if [$? == 0] ;then
echo "Install Xentools version 6.5"
else
echo "Install Xentools version 6.5 impossible"
exit 10

#Install Xentools
bash ${TMP_XSTOOLS}/install.sh -n

