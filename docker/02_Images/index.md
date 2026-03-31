# Docker Images

An image is a layered, read-only template used to create containers. Each instruction in a Dockerfile adds a layer.

## Working with Images

```bash
docker images              # list local images
docker pull nginx          # download an image from Docker Hub
docker pull nginx:1.25     # pull a specific tag
docker inspect nginx       # detailed image metadata
docker rmi nginx           # remove an image
docker image prune         # remove all unused images
```

## Image Tags

Images are identified as `name:tag`. If you omit the tag, Docker uses `latest`.

```bash
docker pull ubuntu          # same as ubuntu:latest
docker pull ubuntu:22.04    # explicit version — recommended in production
```

## The Dockerfile

Images are built from a `Dockerfile`:

```dockerfile
FROM ubuntu:22.04           # base image
RUN apt-get update && apt-get install -y curl   # add a layer
COPY app.sh /app.sh         # copy a file in
CMD ["/app.sh"]             # default command
```

```bash
docker build -t myapp:1.0 .    # build from Dockerfile in current dir
```

## Exercise

1. Run `docker pull nginx` — then `docker images` — what do you see?
2. Pull `nginx:1.24` as well — how many nginx images do you have now?
3. What is the difference between `latest` and a pinned tag like `1.24`?
