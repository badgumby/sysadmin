# Git

### Delete local branch

```
git branch -d branch_to_delete
```

### Delete remote branch

```
git push origin --delete branch_to_delete
```

### Cleanup non-existent remote branches

##### List all branches

```
git branch -a
```

> Example output:
```
bash-4.2$ git branch -a
* master
  dev
  remotes/origin/oldthing

```

##### Remove invalid references

```
git update-ref -d refs/remotes/origin/oldthing
```
