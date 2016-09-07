# Ruby Frameworker Load Tests
This is a WIP and is by no means complete.  The goal of this project is to look at rack-based ruby frameworks, all who use [Puma](https://github.com/puma/puma) as a web server and look at load in terms of concurrency and average response time.  The load profiling is done with [Apache AB 2.4](http://httpd.apache.org/docs/current/).

Benchmark constants:

`ab` is run with a concurrency of `100` and a total request size of `10,000`.

`Puma` is run in clustered mode with a worker size of 2 and thread size of 16 min and 16 max.  The worker size is based on the number of available cores you have so feel free to adjust.  I left the thread size fixed in order to prevent any Puma optimizations that I might not be aware of.  We use ``preload` in order to take advantage of Copy on Write.

The app must respond with a simply JSON payload of `{ "test": 123 }` when a GET request is made to the root path (ie http://127.0.0.1/)

## Cuba

```
Requests per second:    5082.97 [#/sec] (mean)
Time per request:       19.674 [ms] (mean)
Time per request:       0.197 [ms] (mean, across all concurrent requests)
```


## Grape

```
Requests per second:    355.51 [#/sec] (mean)
Time per request:       281.283 [ms] (mean)
Time per request:       2.813 [ms] (mean, across all concurrent requests)
```

## Sinatra


## Hanami

```
Requests per second:    4642.56 [#/sec] (mean)
Time per request:       21.540 [ms] (mean)
Time per request:       0.215 [ms] (mean, across all concurrent requests)
```
