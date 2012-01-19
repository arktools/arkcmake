# git cheat sheet #

This is a list of basic commands for git. 

## Daily use ##

Always do this before beginning any work to get any changes someone else may have made:
```console
git pull
```

To see current un-committed changes: 
```console
git diff
```

To add new and changed files, then commit changes:
```console
git add .
git commit -a
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
