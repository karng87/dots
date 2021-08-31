# save output in terminal
    option
        TERM=screen-256color

## script
```bash
    script
    ...
    exit
    less -r typescript
```
### less -r typescript
---

## script -ttime.log
```bash
    TERM=screen-256color
    script -t time.log
    ...
    exit
    ls
    scriptreplay -t time.log
```
## scriptreplay -t time.log

---

