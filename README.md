# TallinnFWSetup
Things necessary for setting up the whole Tallinn analysis FW

This repository collects all the necessary packages needed to set up the new Tallinn analysis framework

First make sure you are using `python3`. In your .bashrc you should have:

```bash
alias python='python3'
alias pip='pip3'
```


In order to set up the new FW:
```bash
source setup.sh
```


Since also [gita](https://github.com/nosarthur/gita) is installed during setup, this allows one to update all repositories at once like:

```bash
python -m gita pull
```
