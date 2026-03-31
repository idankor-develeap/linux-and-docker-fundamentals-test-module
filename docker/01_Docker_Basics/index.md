# Docker Basics

Docker packages applications into **containers** — isolated, portable units that run the same on any machine.

## Why Containers?

- **Consistent environment** — works on my machine = works everywhere
- **Lightweight** — shares the host OS kernel, faster than VMs
- **Isolated** — each container has its own filesystem, network, and processes

## Core Concepts

- **Image** — a read-only blueprint (like a class)
- **Container** — a running instance of an image (like an object)
- **Registry** — a store for images (e.g. Docker Hub at hub.docker.com)

## First Commands

```bash
docker --version          # confirm docker is installed
docker info               # system-wide info
docker run hello-world    # pull and run a test image
docker ps                 # list running containers
docker ps -a              # list all containers (including stopped)
```

## Exercise

1. Run `docker run hello-world` — read the output carefully
2. Run `docker ps -a` — what status does the hello-world container show?
3. In your own words: what is the difference between an image and a container?
