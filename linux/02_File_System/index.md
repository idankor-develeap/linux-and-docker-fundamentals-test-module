# Linux Filesystem

Linux organises everything in a single tree rooted at `/`. There are no drive letters — disks are mounted as directories.

## Key Directories

| Path | Purpose |
|------|---------|
| `/` | Root of the entire filesystem |
| `/home` | User home directories |
| `/etc` | System configuration files |
| `/var` | Variable data (logs, databases) |
| `/tmp` | Temporary files (cleared on reboot) |
| `/usr/bin` | User-installed programs |

## Absolute vs Relative Paths

- **Absolute** — starts with `/`, always from root: `/home/alice/file.txt`
- **Relative** — from your current directory: `../alice/file.txt`

## Useful Commands

```bash
tree /etc          # show directory tree (install with apt if missing)
find / -name "*.log" 2>/dev/null   # search for files by name
du -sh /var/log    # disk usage of a directory
df -h              # disk usage of all mounts
```

## Exercise

1. Run `ls /` — identify at least 3 directories and their purpose
2. Run `find /etc -name "*.conf" 2>/dev/null` — what do you find?
3. What is the absolute path to your home directory?
