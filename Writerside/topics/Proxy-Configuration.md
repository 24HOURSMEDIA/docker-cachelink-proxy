# Proxy Configuration

## Overview of env variables

| ENV name                | default  | description                         |
|-------------------------|----------|-------------------------------------|
| `CACHE_BACKEND`         |          | backend for the caching proxy       |
| `CACHE_PORT`            |          | port exposed for the caching proxy  |
| `CACHE_STRATEGY`        | `obey`   | `obey` or `force`                   |
| `CACHE_TTL`             | (global) | ttl for cache if strategy = `force` |
| `CACHE_TIMEOUT`         | (global) |                                     |
| `CACHE_CONNECT_TIMEOUT` | (global) |                                     |

## Configuring multiple caching proxies

You can configure multiple caching proxies by suffixing the 'CACHE' part of configuration variables with a number, i.e.

```
CACHE_BACKEND=http://www.example.com
CACHE_PORT=8080
CACHE2_BACKEND=http://www.example.com
CACHE2_PORT=8080
CACHE3_BACKEND=http://www.example.com
CACHE3_PORT=8080
```

## `CACHE_BACKEND`

Caching backends include a protocol, domain/ip and an optional port.
Although the protocol may be https, this is not advised since the proxy is 
not optimized to handle https connections to backends 'far away', and for SNI.

If you need https connections to remote backends, you can put a forward proxy in between
(like the FlowForward proxy of this series).

## `CACHE_STRATEGY`

Cache strategies knows to possible values, 'force' and 'obey' (default).

If the strategy is 'force', all content is cached regardless of the cache headers sent by the backend.
Additionally, the caching TTL is the TTL as configured by `CACHE_TTL` or `DEFAULT_TTL`.

If the strategy is 'obey', the caching proxy will listen to headers sent by the backend (like Cache-Control).


