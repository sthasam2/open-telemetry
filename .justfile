set dotenv-filename := ".just.env"

PROJECT := "telemetry"

up:
    docker compose \
    {{ if env_var('ENABLE_ZIPKIN') == "1" { "--profile zipkin" } else { "" } }} \
    {{ if env_var('ENABLE_PROMETHEUS') == "1" { "--profile prometheus" } else { "" } }} \
    {{ if env_var('ENABLE_NGINX') == "1" { "--profile nginx" } else { "" } }} \
    --profile otel \
    -p {{ PROJECT }} \
    up -d

down:
    docker compose  \
    {{ if env_var('ENABLE_ZIPKIN') == "1" { "--profile zipkin" } else { "" } }} \
    {{ if env_var('ENABLE_PROMETHEUS') == "1" { "--profile prometheus" } else { "" } }} \
    {{ if env_var('ENABLE_NGINX') == "1" { "--profile nginx" } else { "" } }} \
    --profile otel \
    -p {{ PROJECT }} \
    down

restart: down up
