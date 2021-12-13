# git 

## treat only files and dir
> git init
> current dir
>> [untraking file] + [tracking file + sand box(appending contents)]

### [untracking] 
    팀 참가신청하기
> to [tracking]
>> git add

### [working tree with appending contents]
    개인 장비 및 기량 테스트
    appending and edditing contents live in here
> to [untracking]
>> git rm --cached filename

> to index from appending
>> gid add filename


### [index to unstaged junks] 
    색출된 팀 멤버들
    색출시점의 장비만 가지고 와야 함
    더 좋은 필요한 장비가 새로 생겨서 팀에 필요하면 그 시점에서 다시 색인해야함.
    selected contents of editing or appending live in here
    sand box

> to [untracking]
>> git restore --worktree filename

> to staging
>> git commit -m '..'

### [staged area]
    local repository
    commits live in here
> unstaging to index
>> git restore --staaged filename

> to remote repository
>> git push remote branch

### [remote repository]
> to local repository
> git pull

# git restore
    git restore filename
        git restore --worktree filename
    git restore --staged filename
---
