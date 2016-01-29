#! /bin/sh

LB_NAME="opsworks-elb"

BLUE_LAYER_ID="fe0f897b-c6c3-428d-9223-29ea79775c62"
GREEN_LAYER_ID="ae3407de-e1c8-4f02-be89-15aeda7f7dd0"

# green -> blue
#aws opsworks --profile yamaza --region us-east-1 detach-elastic-load-balancer --elastic-load-balancer-name ${LB_NAME} --layer-id ${GREEN_LAYER_ID}
#aws opsworks --profile yamaza --region us-east-1 attach-elastic-load-balancer --elastic-load-balancer-name ${LB_NAME} --layer-id ${BLUE_LAYER_ID}

# blue -> green
aws opsworks --profile yamaza --region us-east-1 detach-elastic-load-balancer --elastic-load-balancer-name ${LB_NAME} --layer-id ${BLUE_LAYER_ID}
aws opsworks --profile yamaza --region us-east-1 attach-elastic-load-balancer --elastic-load-balancer-name ${LB_NAME} --layer-id ${GREEN_LAYER_ID}
