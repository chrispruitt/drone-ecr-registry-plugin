FROM drone/registry-plugin:1.0.0

ENV DRONE_CONFIG_FILE=/config

COPY .docker/entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
