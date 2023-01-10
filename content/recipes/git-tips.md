+++
title = "Git tips"
lastmod = 2023-01-10T18:46:24+01:00
rtags = ["programming", "git"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
+++

## How to get the changes on a branch in Git {#how-to-get-the-changes-on-a-branch-in-git}

```sh
# Changes on branch but not on HEAD (three dots)
git diff HEAD...branch
#
```


## List recent branches and switch {#list-recent-branches-and-switch}

```sh
$ git checkout $(git for-each-ref --sort='-authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs | pick | cut -f2)
# .gitconfig alias
[alias]
branches = "!sh -c \"git checkout $(git for-each-ref --sort='-authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs | pick | cut -f2)\""
```

[Source](https://github.com/rafaelrinaldi/til/blob/master/git/list-branches-by-date.md). Uses [pick](https://github.com/mptre/pick).


## See branches merged into other branch {#see-branches-merged-into-other-branch}

```sh
git branch --merged master    # lists branches merged into master
git branch --merged           # lists branches merged into HEAD (i.e. tip of current branch)
git branch --no-merged        # lists branches that have not been merged
# add -a for all branches (local/remote) or -r for remote only
```

[Source](https://stackoverflow.com/questions/226976/how-can-i-know-if-a-branch-has-been-already-merged-into-master)


## Finding best common ancestors of two commits/branches {#finding-best-common-ancestors-of-two-commits-branches}

```sh
git merge-base <commit> <commit>
```

[Source](https://stackoverflow.com/a/40011122/2024430)


## Check if the branch is current {#check-if-the-branch-is-current}

```sh
$ git fetch && git branch -r --merged | grep -q origin/master && echo Incorporates origin/master || echo Out of date from origin/master

# In ~/.gitconfig
[alias]
   current = !git branch -r --merged | grep -q $1 && echo Incorporates $1 || echo Out of date from $1 && :

And then run:
$ git current origin/master
```

[Source](https://stackoverflow.com/a/53325693/2024430)


## Check if branch can merge without conflicts {#check-if-branch-can-merge-without-conflicts}

```sh
git merge other-branch --no-commit --no-ff
git merge --abort
```

[Source](https://stackoverflow.com/a/6335937/2024430)


## See commits from a branch but not from merged in branches {#see-commits-from-a-branch-but-not-from-merged-in-branches}

```sh
git log --first-parent
```

[Source](https://stackoverflow.com/questions/10248137/git-how-to-list-commits-on-this-branch-but-not-from-merged-branches)


## See what is on a branch {#see-what-is-on-a-branch}

```sh
# Find commit on this
# branch that changed something in the current folder
git log $(git merge-base first_branch HEAD)..HEAD .

git log --no-merges master..
git log --no-merges master..HEAD --author="Jason" .
```


## See files in conflict {#see-files-in-conflict}

```sh
git diff --name-only --diff-filter=U
```


## Check for conflict markers in code {#check-for-conflict-markers-in-code}

```sh
git diff --check
```


## Leaderboards - number of commit by user sorted {#leaderboards-number-of-commit-by-user-sorted}

```sh
git shortlog -sn --all --no-merges
git shortlog -sn --since='10 weeks' --until='2 weeks'
```


## See recent branches you have been working on {#see-recent-branches-you-have-been-working-on}

```sh
git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"
# alias
recent = "for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
```


## Remind yourself what you have been doing {#remind-yourself-what-you-have-been-doing}

```sh
git log --all --oneline --no-merges --author=igor.dejanovic
# alias
recap = "log --all --oneline --no-merges --author=igor.dejanovic"
```


## See what is changed in the merge conflict resolution {#see-what-is-changed-in-the-merge-conflict-resolution}

```sh
git diff hash hash^1 hash^2
```

[Source](https://stackoverflow.com/questions/16573555/show-conflict-diff-part-of-a-merge)


## [git rerere - reuse recorded resolutions](https://medium.com/@porteneuve/fix-conflicts-only-once-with-git-rerere-7d116b2cec67) {#git-rerere-reuse-recorded-resolutions}


## Delete local branches whose remotes were deleted {#delete-local-branches-whose-remotes-were-deleted}

```sh
git config --global alias.gone "! git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"
```

[Source](https://stackoverflow.com/questions/41592156/git-command-to-remove-local-branches-that-have-a-deleted-upstream). Now `git gone` will delete all local branches whose remotes were deleted.


## Find large files in the repo history {#find-large-files-in-the-repo-history}

-   This works but is slow for large repos.

<!--listend-->

```sh
git rev-list --all | while read rev ; do git ls-tree -rl --full-name $rev ; done | sort -k4 -nr | uniq > large.txt
```

-   This works much faster! See <https://stackoverflow.com/a/42544963/2024430>
    Use `--since="2022-09-10"` to return only recent blobs.

<!--listend-->

```sh
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  cut -c 1-12,41- |
  numfmt --field=2 --to=iec-i --suffix=b --padding=7 --round=neares
```


## Compare two branches {#compare-two-branches}

Some commands use [kompare](https://apps.kde.org/kompare/) or [meld](http://meldmerge.org/).

-   Show only file names ignoring whitespace (`-w`):
    ```sh
        git diff -w --name-status master..integration
    ```
-   Show changes between tips of two branches.
    ```sh
        git diff master..integration | kompare -
    ```
-   See the diff of modified files only between two branches in folder `src`.
    ```sh
        git diff -w --diff-filter=M master..integration src/ | kompare -
    ```
-   See what is on branch `integration` but not on `master` (notice three dots).
    ```sh
        git diff master...integration | kompare -
    ```
-   To use meld in previous recipes do the following:
    1.  Configure meld as a diff tool:
        ```sh
                  git config --global diff.tool meld
        ```
    2.  Use git `--dir-diff`. For example:
        ```sh
                  git difftool -d master...integration
        ```


## References {#references}

-   <https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/>
