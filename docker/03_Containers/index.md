# Docker Containers

Containers are ephemeral by default — data is lost when a container is removed. Volumes solve this.

## Container Lifecycle

```bash
docker run -d --name myapp nginx   # run detached with a name
docker ps                          # confirm it's running
docker logs myapp                  # view output
docker exec -it myapp bash         # open a shell inside
docker stop myapp                  # stop (graceful)
docker start myapp                 # restart a stopped container
docker rm myapp                    # remove (must be stopped first)
docker rm -f myapp                 # force remove even if running
```

## Volumes — Persisting Data

```bash
# Mount a host directory into the container
docker run -v /host/path:/container/path nginx

# Named volume (managed by Docker)
docker run -v mydata:/data nginx
docker volume ls                   # list volumes
docker volume rm mydata            # delete a volume
```

## Port Mapping

```bash
# Map host port 8080 to container port 80
docker run -d -p 8080:80 --name web nginx
# Visit http://localhost:8080
```

## Exercise

1. Run nginx with a name and port mapping: `docker run -d -p 8080:80 --name web nginx`
2. Visit `http://localhost:8080` — what do you see?
3. Run `docker logs web` — what does nginx log on each request?
4. Exec into it: `docker exec -it web bash`, then `ls /usr/share/nginx/html`
5. Stop and remove: `docker rm -f web`
