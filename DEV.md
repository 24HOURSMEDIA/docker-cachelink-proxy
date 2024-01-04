# Development notes

## In-container development

Build and launc a daemon with defaults.
Then open a shell.
Config files are bind-mounted so you can change them on the fly.

```
docker compose -f docker-compose.dev.yml up -d --build --force-recreate
docker compose -f docker-compose.dev.yml exec -it cachelink_proxy /bin/ash
```

Reparse the config files and reload nginx (in the container):

```
tango parse:dir /config-templates/nginx.conf.d /etc/nginx/conf.d && nginx -s reload
```

Preview the cachelink file proxy config

```
tango parse:file /config-templates/nginx.conf.d/10-cachelink.conf.twig
```

Reload the env vars from example_env.env

```
set -o allexport && source /example_env.env set && set +o allexport 
```