#!/bin/bash -e

echo "Start build process"
cd bosh-repo/
bundle install
bundle exec rake stemcell:build_os_image[ubuntu,trusty,$PWD/tmp/ubuntu_base_image.tgz] 
bundle exec rake stemcell:build_with_local_os_image[aws,xen,ubuntu,trusty,go,$PWD/tmp/ubuntu_base_image.tgz]
#bundle exec rake stemcell:build_with_local_os_image[cloudstack,xen,ubuntu,trusty,go,/tmp/ubuntu_base_image.tgz]

