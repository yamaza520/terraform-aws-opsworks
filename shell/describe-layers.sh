#! /bin/sh

SHELL_DIR=$(cd $(dirname $0) && pwd)
source ${SHELL_DIR}/variables.sh

aws opsworks --profile yamaza --region us-east-1 describe-layers --stack-id ${BLUE_STACK_ID}
aws opsworks --profile yamaza --region us-east-1 describe-layers --stack-id ${GREEN_STACK_ID}
