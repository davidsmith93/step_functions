#!/bin/bash

function create_lambda () {
    echo "Creating $1 for runtime $2"
    zip -r "$1.zip" "$1/$2"

    echo $(aws --endpoint-url=http://localhost:4574 \
        lambda \
        create-function \
        --function-name "$1" \
        --runtime "$2" \
        --role arn:aws:iam::012345678901:role/DummyRole \
        --handler "$1.$2.handler.lambda_handler" \
        --zip-file "fileb://$1.zip"
    )
}

function create_step_function () {
    echo "Creating step function $0"

    echo $(aws --endpoint-url=http://localhost:4585 \
        stepfunctions \
        create-state-machine \
        --name "$1" \
        --definition "file://$1/definition.json" \
        --role-arn arn:aws:iam::012345678901:role/DummyRole
    )
}

create_step_function "workflow"
create_lambda "hello_lambda" "python3_8"
