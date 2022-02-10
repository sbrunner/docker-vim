VI Docker image

Build:

```
docker build --tag=sbrunner/vi .
```

Push:

```
docker push sbrunner/vi
```

Run:

```
docker run --rm -ti --volume=`pwd`:/src sbrunner/vi bash
```
