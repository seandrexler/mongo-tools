#!/bin/bash

if [[ "${HOME}" != "/root" && "${PWD}" == "/root" ]]; then
  cd "${HOME}"
fi

if [[ $# -ne 0 ]]; then
  exec "$@"
else
  exec /bin/bash -l
fi
