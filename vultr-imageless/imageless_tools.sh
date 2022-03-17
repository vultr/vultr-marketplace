#!/bin/bash

function add_binaries() {
    DIR=$1
    BASEDIR=$2
    for f in ${DIR}/*
    do
        if [ -d ${f} ]; then
            add_binaries ${f} ${BASEDIR}
            continue
        fi

        LOCATION="/$(realpath --relative-to="${BASEDIR}" "${f}")"

        name=$(basename ${f})
        b64="$(base64 -w 0 "${f}")"
        echo "- encoding: b64"
        echo "  content: ${b64}"
        echo "  owner: root:root"
        echo "  path: ${LOCATION}"

        CONTENT="$(cat ${f})"
        PERMISSION="0644"
        if [[ "${CONTENT}" == "#!"* ]]; then
            PERMISSION="0744"
        fi
        echo "  permissions: '${PERMISSION}'"
    done
}

function generate_binaries() {
    ROOTFS=$1

    echo "write_files:"
    add_binaries ${ROOTFS} ${ROOTFS}
}