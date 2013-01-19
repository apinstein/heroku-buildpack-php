#!/bin/bash

PREFIX=/tmp
BUILD_DIR=${PREFIX}/app-build
CACHE_DIR=${PREFIX}/app-cache

mkdir -p ${BUILD_DIR} ${CACHE_DIR}
rm -rf ${BUILD_DIR}/*
touch ${BUILD_DIR}/repo

bin/compile ${BUILD_DIR} ${CACHE_DIR}
