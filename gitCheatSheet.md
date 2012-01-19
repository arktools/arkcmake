# git cheat sheet #

This is a list of basic commands for git. 

## Daily use ##

Always do this before beginning any work to get any changes someone else may have made (this can avoid a lot of headaches):

```console
git pull
```

To see current un-committed changes: 

```console
git diff
```

To add all new and changed files, then commit changes:

```console
git add .
git commit -a
```

Pushing changes to the server **VERY IMPORTANT** do this every time:

```console
git push
```

If you get an error from the previous command: 

```console
git push origin master
```

## Intermediate steps ##

To only commit changes to the file "new":
(example: you changed trim states but do not want to save them)

```console
git add new
git commit
```

Reverting all changes since last commit:

```console
git reset --hard
```
Using branches (a great idea if you think you might break everything)

```console
git branch experiment
git checkout experiment
```

To switch back to the main files: 

```console
git checkout master
```

To combine the code from the branch back into the main files (this may cause conflicts, which will be clearly marked in the file):

```console
git merge experiment
```

## Initial setup ##

To fetch a project for the first time (aka clone a repository):
(substitute appropriate address)

```console
git clone git@github.com:jgoppert/jsbsim.git
```

To setup your username and password (so everyone knows who did such great work!):

```console
git config --global user.name "Firstname Lastname"
git config --global user.email "your_email@youremail.com"
```
