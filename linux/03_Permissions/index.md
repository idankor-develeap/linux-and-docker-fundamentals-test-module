# Linux Permissions

Every file has an owner, a group, and a permission set controlling who can read, write, or execute it.

## Reading Permissions

```
-rwxr-xr--  1 alice devs  1234 Mar 30 10:00 script.sh
 ^^^
 |||
 ||+-- execute (x) — run as a program
 |+--- write   (w) — modify the file
 +---- read    (r) — view the file
```

Three groups: **owner** | **group** | **others**

## Numeric Mode

| Number | Permissions |
|--------|-------------|
| 7 | rwx |
| 6 | rw- |
| 5 | r-x |
| 4 | r-- |
| 0 | --- |

`chmod 755` = owner: rwx, group: r-x, others: r-x

## Common Commands

```bash
ls -l           # see permissions
chmod 755 f     # set permissions numerically
chmod +x f      # add execute for all
chown alice f   # change owner
chown alice:devs f  # change owner and group
stat f          # full file details
```

## Exercise

1. Create a file: `touch test.txt`
2. Check its permissions: `ls -l test.txt`
3. Make it executable: `chmod +x test.txt`
4. Verify with `ls -l` — what changed?
5. What would `chmod 600` mean?
