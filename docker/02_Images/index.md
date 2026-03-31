# Docker Images

An image is a **layered, read-only template** used to create containers. Every instruction in a `Dockerfile` adds a new layer on top of the previous one.

---

## How Layers Work

```
  Layer 4:  COPY app.py /app/          ← your application code
  Layer 3:  RUN pip install flask      ← installed dependencies
  Layer 2:  RUN apt-get install python ← OS packages
  Layer 1:  FROM ubuntu:22.04          ← base OS
```

Layers are **cached** and **shared** between images. If two images both use `FROM ubuntu:22.04`, that layer is stored only once on disk.

---

## Working with Images

```bash
docker images                  # list local images
docker pull nginx              # download latest nginx
docker pull nginx:1.25         # pull a specific tag
docker inspect nginx           # detailed metadata (OS, layers, env vars)
docker history nginx           # show layers and their sizes
docker rmi nginx               # remove a local image
docker image prune             # remove all unused (untagged) images
docker image prune -a          # remove ALL unused images
```

---

## Image Tags

Images are identified as `name:tag`. Omitting the tag defaults to `latest`.

| Pull command | Resolves to |
|-------------|-------------|
| `docker pull nginx` | `docker.io/library/nginx:latest` |
| `docker pull nginx:1.25` | `docker.io/library/nginx:1.25` |
| `docker pull myuser/myapp:v2` | `docker.io/myuser/myapp:v2` |

> ⚠️ **Avoid `latest` in production** — it changes silently. Always pin to a specific version tag.

---

## The Dockerfile

Images are built from a plain text file called `Dockerfile`.

```dockerfile
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
WORKDIR /app
COPY app.sh .
RUN chmod +x app.sh
CMD ["./app.sh"]
```

```bash
docker build -t myapp:1.0 .        # build image from Dockerfile in current dir
docker build -t myapp:1.0 -f path/to/Dockerfile .  # specify a different file
```

---

## Downloadable Examples

Try building these yourself:

📄 [Sample Dockerfile — Python web app](sample.Dockerfile)
📄 [Sample docker-compose.yml — nginx + app](sample-compose.yml)

---

## Further Reading

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Docker Hub — official images](https://hub.docker.com/search?q=&type=image&image_filter=official)

---

## Exercise

1. Run `docker pull nginx` — then `docker images` — what columns do you see?
2. Pull `nginx:1.24` as well — how many nginx entries appear now?
3. Run `docker history nginx` — how many layers does it have?
4. What is the risk of using `latest` in a production deployment?
5. **Bonus:** Create a `Dockerfile` based on `alpine:3.19` that runs `echo "Hello from my image"`. Build it and run it.
