#!/bin/sh -x

RABBITMQ_REPO_DIR=../rabbitmq-server
RABBITMQ_SERVER_TAG=rabbitmq_v3_3_5
BASEDIR=.

pushd $RABBITMQ_REPO_DIR
git checkout $RABBITMQ_SERVER_TAG
cd ..
git clone https://github.com/rabbitmq/rabbitmq-codegen.git
cd rabbitmq-server
make
popd

SRC_FILES=`ls $BASEDIR/src`

#COPY SRC Files
for file in $SRC_FILES
do
	cp $RABBITMQ_REPO_DIR/src/$file $BASEDIR/src
done

#COPY HRL

HRL_FILES=`ls $BASEDIR/include`

for file in $HRL_FILES
do
	cp $RABBITMQ_REPO_DIR/include/$file $BASEDIR/include
done

