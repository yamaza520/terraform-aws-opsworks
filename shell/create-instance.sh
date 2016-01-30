#! /bin/sh

SHELL_DIR=$(cd $(dirname $0) && pwd)
source ${SHELL_DIR}/variables.sh

aws opsworks --profile yamaza --region us-east-1 create-instance \
    --stack-id ${BLUE_STACK_ID} \
    --hostname "blue-web1" \
    --layer-ids ${BLUE_WEB_LAYER_ID} \
    --instance-type "t2.micro" \
    --root-device-type ebs

aws opsworks --profile yamaza --region us-east-1 create-instance \
    --stack-id ${GREEN_STACK_ID} \
    --hostname "green-web1" \
    --layer-ids ${GREEN_WEB_LAYER_ID} \
    --instance-type "t2.micro" \
    --root-device-type ebs
