# Docker Basics — Quick Reference Cheatsheet

## Essential Commands

| Command | What it does |
|---------|-------------|
| `docker --version` | Show installed Docker version |
| `docker info` | Show system-wide Docker info |
| `docker run hello-world` | Pull and run the hello-world test image |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers (running + stopped) |
| `docker images` | List locally stored images |
| `docker pull <image>` | Download an image without running it |
| `docker rm <id>` | Remove a stopped container |
| `docker rmi <image>` | Remove a local image |

## Key Concepts

- **Image** = blueprint (read-only)
- **Container** = running instance of an image
- **Registry** = remote store for images (default: Docker Hub)
- **Tag** = version label on an image (e.g. `nginx:1.25`)

## Image Naming

```
nginx              →  docker.io/library/nginx:latest
nginx:1.25         →  docker.io/library/nginx:1.25
myuser/myapp:v2    →  docker.io/myuser/myapp:v2
```

## Useful Flags for `docker run`

| Flag | Meaning |
|------|---------|
| `-d` | Detached (run in background) |
| `-it` | Interactive terminal |
| `--name web` | Give the container a name |
| `-p 8080:80` | Map host port 8080 → container port 80 |
| `-v /host:/container` | Mount a volume |
| `--rm` | Auto-remove container when it exits |

## Resources

- Docs: https://docs.docker.com
- Hub:  https://hub.docker.com
- Play: https://labs.play-with-docker.com
