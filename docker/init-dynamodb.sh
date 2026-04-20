#!/bin/sh
set -eu

ENDPOINT="${DB_CONNECTION:-http://dynamodb-local:8000}"
REGION="${AWS_REGION:-us-west-2}"

echo "Waiting for DynamoDB Local at ${ENDPOINT}..."
until aws dynamodb list-tables \
  --endpoint-url "${ENDPOINT}" \
  --region "${REGION}" >/dev/null 2>&1; do
  sleep 1
done

create_table_if_missing() {
  table_name="$1"
  key_name="$2"

  if aws dynamodb describe-table \
    --table-name "${table_name}" \
    --endpoint-url "${ENDPOINT}" \
    --region "${REGION}" >/dev/null 2>&1; then
    echo "Table ${table_name} already exists."
    return
  fi

  echo "Creating table ${table_name}..."
  aws dynamodb create-table \
    --table-name "${table_name}" \
    --attribute-definitions "AttributeName=${key_name},AttributeType=S" \
    --key-schema "AttributeName=${key_name},KeyType=HASH" \
    --billing-mode PAY_PER_REQUEST \
    --endpoint-url "${ENDPOINT}" \
    --region "${REGION}" >/dev/null
}

create_table_if_missing "boards" "Board"
create_table_if_missing "articles" "Code"

echo "DynamoDB initialization completed."
