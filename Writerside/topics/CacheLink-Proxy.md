# %product%

<include from="library.md" element-id="app_urls"/>

CacheLink Proxy is a caching proxy solution that operates within Docker containers, 
offering simple and efficient configuration through the use of environment variables.

## Features

* configuration with .env, not with conf files
* two caching modes: force and obey
* reduces cache stampede by serving stale content while updating
* supports multiple cache backends

## Getting Started

```
docker run --rm \
    --env "DEBUG=on" \
    --env "CACHE_PORT=28800" \
    --env "CACHE_BACKEND=http://www.example.com" \
    --publish "28800:28800" \
    %example_docker_image%
```

```
curl -I http://127.0.0.1:28800

# Response headers (with DEBUG info)
HTTP/1.1 200 OK
Date: Thu, 04 Jan 2024 19:12:12 GMT
Content-Type: text/html; charset=UTF-8
Content-Length: 1256
Connection: keep-alive
Age: 150040
Cache-Control: max-age=604800
Etag: "3147526947+ident"
Expires: Thu, 11 Jan 2024 19:12:04 GMT
Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
Vary: Accept-Encoding
X-Cache: HIT
X-CacheLink-Status: HIT
X-CacheLink-Dbg-Config: {"BACKEND":"http://www.example.com","CONNECT_TIMEOUT":30,"PORT":"28800","STRATEGY":"obey","TIMEOUT":120,"TTL":60}
X-CacheLink-Dbg-Cache-Key: HEAD http://127.0.0.1:28800/
X-CacheLink-Dbg-Cache-Zone: cachelink1_zone
```