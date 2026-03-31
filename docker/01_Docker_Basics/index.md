# Docker Basics

Docker packages applications into **containers** — isolated, portable units that run the same on any machine.

---

> 💡 **New to containers?**
> Think of a container like a shipping container: it holds everything the app needs, seals it in, and can be moved to any ship (host) that speaks the same protocol.

---

## Why Containers?

| Problem | Without Docker | With Docker |
|---------|---------------|-------------|
| "Works on my machine" | Dependency hell | Same image everywhere |
| Setup time | Hours of config | `docker run` |
| Isolation | Shared dependencies | Each app self-contained |
| Scaling | Manual VM provisioning | Spin up containers in seconds |

---

## Core Concepts

- **Image** — a read-only blueprint (like a class in OOP)
- **Container** — a running instance of an image (like an object)
- **Registry** — a store for images; Docker Hub is the default public registry
- **Daemon** — the background service (`dockerd`) that manages containers
- **Client** — the `docker` CLI that talks to the daemon

```
  You (CLI)
     │
     ▼
  Docker Daemon  ──────►  Registry (Docker Hub)
     │
     ▼
  Containers  (running images)
```

---

## First Commands

```bash
docker --version          # confirm docker is installed
docker info               # system-wide info (images, containers, storage driver)
docker run hello-world    # pull + run a test image
docker ps                 # list running containers
docker ps -a              # list ALL containers (including stopped)
```

---

## Video Introduction

Watch this 5-minute overview before starting the exercises:

▶ [Docker in 100 Seconds — Fireship](https://www.youtube.com/watch?v=Gjnup-PuquQ)

---

## Reference

📄 Download the quick-reference cheatsheet for this lesson:
[docker-basics-cheatsheet.md](docker-basics-cheatsheet.md)

---

## Further Reading

- [Docker official "Get Started" guide](https://docs.docker.com/get-started/)
- [Play with Docker — browser-based sandbox](https://labs.play-with-docker.com/)
- [Docker Hub](https://hub.docker.com/) — browse public images

---

## Exercise

1. Run `docker run hello-world` — read the output carefully. What steps does Docker describe?
2. Run `docker ps -a` — what status does the hello-world container show and why?
3. In your own words: what is the difference between an image and a container?
4. Run `docker images` — what images are stored locally?
