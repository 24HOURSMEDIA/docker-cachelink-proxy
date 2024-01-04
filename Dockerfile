ARG NGINX_IMAGE=nginx:1.25-alpine3.18-slim
ARG TANGO_IMAGE=24hoursmedia/go-templatetango:1.8.0

FROM ${TANGO_IMAGE} AS templatetango

FROM ${NGINX_IMAGE} AS cachelink_proxy
#RUN apk --no-cache update && apk --no-cache upgrade
COPY --from=templatetango --chmod=775 /tango /usr/local/bin/tango
COPY ./files/config-templates /config-templates
COPY --chmod=775 ./files/docker-entrypoint.d /docker-entrypoint.d