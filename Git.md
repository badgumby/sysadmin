# Git


### List all branches

```
git branch -a
```

---

### Delete local branch

```
git branch -d branch_to_delete
```

---

### Delete remote branch

```
git push origin --delete branch_to_delete
```

---

### Cleanup non-existent remote branches

##### List branches and find the one you want to remove

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
