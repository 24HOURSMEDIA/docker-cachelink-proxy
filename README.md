# CacheLink Proxy

[Full Documentation](https://24hoursmedia.github.io/docker-cachelink-proxy)

CacheLink Proxy is a caching proxy solution that operates within Docker containers, offering simple and efficient configuration through the use of environment variables.

## Getting Started

```
docker run --rm \
--env "DEBUG=on" \
--env "CACHE_PORT=28800" \
--env "CACHE_BACKEND=http://www.example.com" \
--publish "28800:28800" \
%example_docker_image%
```