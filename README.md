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

## Contributing

Install the pre-commit hooks:

```bash
pip install pre-commit
pre-commit install --allow-missing-config
```
