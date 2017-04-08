#!/bin/bash

linux_src_path="$1"


if [ "${linux_src_path}" == "" ]; then
  echo "Usage: $0 /path/to/linux-kernel-source"
  exit 1
fi

# get path to this script
DIR="$(dirname $(readlink -f "$0"))"

# We can't just create a symlink on the .vimprj dir itself, because tags are
# stored in .vimprj/.indexer_files_tags, and obviously this directory should be
# stored in the kernel tree, not in my-linux-utils repo.
#
# So, we create a symlink to each file inside of the .vimprj dir.
mkdir -p ${linux_src_path}/.vimprj
for i in $(ls -a ${DIR}); do
  if [[ "$i" == "." || "$i" == ".." ]]; then
    continue
  fi

  if [ ! -e ${linux_src_path}/.vimprj/$i ]; then
    echo "creating $i ..."
    ln -s ${DIR}/$i ${linux_src_path}/.vimprj/$i
  else
    echo "$i exists, skipping..."
  fi
done
