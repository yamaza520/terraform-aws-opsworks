#! /bin/sh

BLUE_STACK_ID="b67e3b6c-96c2-4d99-8543-8d39ce18fa58"
GREEN_STACK_ID="7f01f733-42de-4330-a1b8-0c4a97123782"

aws opsworks --profile yamaza --region us-east-1 describe-layers --stack-id ${BLUE_STACK_ID}
aws opsworks --profile yamaza --region us-east-1 describe-layers --stack-id ${GREEN_STACK_ID}
