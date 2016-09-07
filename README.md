# Ruby Frameworker Load Tests
This is a WIP and is by no means complete.  The goal of this project is to look at rack-based ruby frameworks, all who use [Puma](https://github.com/puma/puma) as a web server and look at load in terms of concurrency and average response time.  The load profiling is done with [Apache AB 2.4](http://httpd.apache.org/docs/current/).

Benchmark constants:

`ab` is run with a concurrency of `100` and a total request size of `10,000`.

`Puma` is run in clustered mode with a worker size of 2 and thread size of 16 min and 16 max.  The worker size is based on the number of available cores you have so feel free to adjust.  I left the thread size fixed in order to prevent any Puma optimizations that I might not be aware of.  We use ``preload` in order to take advantage of Copy on Write.

The app must respond with a simply JSON payload of `{ "test": 123 }` when a GET request is made to the root path (ie http://127.0.0.1/)

## WARNING

The benchmark script is providing very strange results, I'm still trying to understand why. To test this today, I suggest:

```
cd cuba
bundle exec puma -t 16:16 -w 2 --preload
# open new terminal window
ab -n 10000 -c 100 http://127.0.0.1:9292/
```

## Cuba

```
Requests per second:    4058.79 [#/sec] (mean)
Time per request:       24.638 [ms] (mean)
Time per request:       0.246 [ms] (mean, across all concurrent requests)
```

## Grape

```
Requests per second:    3382.01 [#/sec] (mean)
Time per request:       29.568 [ms] (mean)
Time per request:       0.296 [ms] (mean, across all concurrent requests)
```

## Sinatra

```
Requests per second:    2523.10 [#/sec] (mean)
Time per request:       39.634 [ms] (mean)
Time per request:       0.396 [ms] (mean, across all concurrent requests)
```

## Hanami

```
Requests per second:    4468.30 [#/sec] (mean)
Time per request:       22.380 [ms] (mean)
Time per request:       0.224 [ms] (mean, across all concurrent requests)
```

## Results

Take the results above with a grain of salt.  I'm still tweaking the set up of these frameworks to hopefully compare apples to apples.  I'm very surprised Sinatra is running at 60% of Cuba or Hanami and I'm looking into other configuration details to speed up Sinatra if possible.

## What's next?

I've started to run ruby-prof to identify bottlenecks in each framework and hopefully come up with some optimization strategies for each.
