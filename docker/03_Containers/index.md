# Docker Containers

Containers are **ephemeral by default** — all data written inside a container is lost when it is removed. Volumes solve this.

---

## Lesson Slides

Before reading, open the visual summary of this lesson:

🖥️ [containers-slideshow.html](containers-slideshow.html) — open in your browser

---

## Container Lifecycle

```
 docker run   →   Running   →   docker stop   →   Stopped   →   docker rm   →   Gone
                     │                                │
                docker exec                      docker start
                  (shell)                         (restart)
```

```bash
docker run -d --name myapp nginx   # run detached with a name
docker ps                          # confirm it is running
docker logs myapp                  # view stdout/stderr output
docker logs -f myapp               # follow logs in real time
docker exec -it myapp bash         # open a shell inside the container
docker stop myapp                  # graceful stop (SIGTERM → SIGKILL after timeout)
docker start myapp                 # restart a stopped container
docker rm myapp                    # remove (container must be stopped first)
docker rm -f myapp                 # force-remove even while running
```

---

## Port Mapping

Containers are isolated — ports must be explicitly exposed to the host.

```bash
# Syntax: -p <host_port>:<container_port>
docker run -d -p 8080:80 --name web nginx
# Now visit: http://localhost:8080
```

| Host | Container | Use |
|------|-----------|-----|
| 8080 | 80 | HTTP |
| 8443 | 443 | HTTPS |
| 5432 | 5432 | PostgreSQL |

---

## Volumes — Persisting Data

```bash
# Bind mount — host directory mirrored into container
docker run -v /host/path:/container/path nginx

# Named volume — managed by Docker, survives container removal
docker run -v mydata:/data nginx

docker volume ls           # list all named volumes
docker volume inspect mydata  # details (mount point, driver)
docker volume rm mydata    # delete a volume (container must not be using it)
docker volume prune        # delete all unused volumes
```

> ⚠️ **Bind mounts** are great for development (live code reload). **Named volumes** are better for production data — Docker manages the path and lifecycle.

---

## Environment Variables

Pass configuration without baking it into the image:

```bash
docker run -e DB_HOST=localhost -e DB_PORT=5432 myapp:1.0

# Or load from a file
docker run --env-file .env myapp:1.0
```

---

## Further Reading

- [Docker containers overview](https://docs.docker.com/get-started/02_our_app/)
- [Manage data in Docker (volumes)](https://docs.docker.com/storage/volumes/)
- [docker run reference](https://docs.docker.com/engine/reference/run/)

---

## Exercise

1. Run nginx: `docker run -d -p 8080:80 --name web nginx`
2. Visit `http://localhost:8080` — what page appears?
3. Run `docker logs web` — what does nginx log?
4. Exec in: `docker exec -it web bash`, then run `ls /usr/share/nginx/html` — what files serve the default page?
5. Exit, then `docker rm -f web`
6. **Bonus:** Run nginx again, but this time mount a local directory as `/usr/share/nginx/html` and serve your own `index.html`
