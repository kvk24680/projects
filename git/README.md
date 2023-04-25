#### git log

Check the logs of specific branch

```git
# show the logs of the division branch directly with using **git checkout**
git log division
```

#### git merge
```git

git checkout main
git merge [branch-to-be-merged]
```

#### git rebase

1. It is the process of moving or combining a sequence of commits to a new base commit. 
2. Use rebase whenever you want to add changes of a base branch back to a branched out branch. Typically, you do this in feature branches whenever there's a change in the main branch.

```git
git checkout main
git rebase [rebasing Branch]
```

#### git stash

1. The git stash command takes your uncommitted changes (both staged and unstaged), saves them away for later use, and then reverts them from your working copy. 
2. Git stash temporarily shelves (or stashes) changes you've made to your working copy so you can work on something else, and then come back and re-apply them later on. Stashing is handy if you need to quickly switch context and work on something else, but you're mid-way through a code change and aren't quite ready to commit.

```git
$ git status
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

$ git stash
Saved working directory and index state WIP on main: 5002d47 our new homepage
HEAD is now at 5002d47 our new homepage

$ git status
On branch main
nothing to commit, working tree clean
```
You can reapply previously stashed changes with `git stash pop`

```git
$ git status
On branch main
nothing to commit, working tree clean
$ git stash pop
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Dropped refs/stash@{0} (32b3aa1d185dfe6d57b3c3cc3b32cbf3e380cc6a)
```

#### git cherrypick

1. Git cherrypick refers to picking the commits froma specific branch and applying to the current branch. It applies the changes introduced by some existing commits.

```git
# goal: to copy the commit from division branch and apply it in main branch 

git log division

# copy the commit ID

git checkout main
git cherry-pick [commit ID]

# check if the commit is added to the main branch
git log main
```

#### git clone v/s git fork
Any public Git repository can be forked or cloned. A fork creates a completely independent copy of Git repository. In contrast to a fork, a Git clone creates a linked copy that will continue to synchronize with the target repository.

When a Git repository is cloned, the target repository remains shared amongst all of the developers who had previously contributed to it. Other developers who had previously contributed to that codebase will continue to push their changes and pull updates from the cloned repository. Any developer who clones a repository can synchronize their copy of the codebase with any updates made by fellow developers.

In contrast to a clone, a Git fork operation will create a completely new copy of the target repository. The developer who performs the fork will have complete control over the newly copied codebase. Developers who contributed to the Git repository that was forked will have no knowledge of the newly forked repo. Previous contributors will have no means with which they can contribute to or synchronize with the Git fork unless the developer who performed the fork operation provides access to them.

#### Amending a commit in git

Add something to the existing commit. It fixes a broken commit. 

#### How to resolve a merge conflict in Git?

Communicate with the developer and fix it. 

**Commands**

#### Reference

##### [Git Rebase vs Merge](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)

##### [Abhishek Veeramalla's Git Tutorial](https://www.youtube.com/watch?v=mT6qrAx14O4&list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa&index=16)

##### [Git Interview QA Part-1](https://www.youtube.com/watch?v=VmJpdIOiIaU)

##### [Git Atlassian - Git Stash](https://www.atlassian.com/git/tutorials/saving-changes/git-stash#:~:text=The%20git%20stash%20command%20takes,for%20commit%3A%20modified%3A%20index.)
