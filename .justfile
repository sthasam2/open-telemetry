set dotenv-filename := ".just.env"

PROJECT:= "telemetry"

up:
    docker compose \
    {{ if '${ENABLE_ZIPKIN}' == "1" { "--profile zipkin" } else { "" } }} \
    {{ if '${ENABLE_PROMETHEUS}' == "1" { "--profile prometheus" } else { "" } }} \
    {{ if '${ENABLE_NGINX}' == "1" { "--profile nginx" } else { "" } }} \
    --profile otel \
    -p {{PROJECT}} \
    up -d

down:
    docker compose -p {{PROJECT}} down

restart: down up
