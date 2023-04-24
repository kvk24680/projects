#### git log

Check the logs of specific branch

```bash
# show the logs of the division branch directly with using **git checkout**
git log division
```

#### git merge
```bash

git checkout main
git merge [branch-to-be-merged]
```

#### git rebase

1. It is the process of moving or combining a sequence of commits to a new base commit. 
2. Use rebase whenever you want to add changes of a base branch back to a branched out branch. Typically, you do this in feature branches whenever there's a change in the main branch.

```bash
git checkout main
git rebase [rebasing Branch]
```

#### git cherrypick

1. Git cherrypick refers to picking the commits froma specific branch and applying to the current branch. It applies the changes introduced by some existing commits.

```bash
# goal: to copy the commit from division branch and apply it in main branch 

git log division

# copy the commit ID

git checkout main
git cherry-pick [commit ID]

# check if the commit is added to the main branch
git log main
```
#### Reference

#####[Git Rebase vs Merge](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)

#####[Abhishek Veeramalla's Git Tutorial](https://www.youtube.com/watch?v=mT6qrAx14O4&list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa&index=16)

#####[Git Interview QA Part-1](https://www.youtube.com/watch?v=VmJpdIOiIaU)