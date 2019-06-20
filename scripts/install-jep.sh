#!/usr/bin/env bash

set -e
set -x

pip3 install --upgrade --force-reinstall jep # Jep was installed in a bad location, so we need to keep this for a bit.
pip3 install ipython nbconvert jedi

# this all assumes that jep was installed to a normal place
jep_site_packages_path=`pip3 show jep | grep "^Location:" | cut -d ':' -f 2 | cut -d ' ' -f 2`
jep_path=${jep_site_packages_path}/jep
jep_lib_path=`realpath ${jep_site_packages_path}/../../`

export LD_LIBRARY_PATH=${jep_path}:${jep_site_packages_path}:${jep_lib_path}:${LD_LIBRARY_PATH}
echo ${LD_LIBRARY_PATH}

export LD_PRELOAD=${jep_lib_path}/libpython3.so
echo ${LD_PRELOAD}
