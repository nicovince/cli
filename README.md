# cli
presentation for command line interface tools for linux/unix
## cd
### Go back to previous directory
```
cd -
```
### Go to home directory 
```
cd
# or
cd ~
```

## ls
### size in human readable form
```ls -lh```
### sort by timestamp, latest file at the top
```ls -lt```
### reverse order
```ls -lrt```

## head
get the 10 first lines of a file (or stdin)
### specify number of lines
```
head -5
head -n 5
```

## tail
get the 10 last lines of a file (or stdin)
### specify number of lines
```
tail -5
tail -n 5
```
### Monitor a file on live
```tail -f <file>```

Particulary useful for log files

## basename
returns filename of path provided in argument

```basename /path/to/foo
foo```

pathname does not have to be a path to a valid file

## dirname
returns folder of given pathname

```dirname /path/to/foo
/path/to```

pathname does not have to be a path to a valid file


## sed
`sed` stands for Stream EDitor often used for editing on the fly some file(s) or standard output.

Used to perform automatic edititon on an input stream or an existing file :
- search and replace
```sed 's/search/replace/g'```
- delete lines matching a pattern
```sed '/pattern on line to delete/d'```
- delete line or range of lines
```sed '3d'
sed '3,5d'```

If you want to modify an existing files, instead of having sed doing modifications on standard input you can use ```-i``` flag
```sed -i 's/search/replace/g' filename
sed -i.bak 's/search/replace/g' filename
```

Sed can memorize patterns on the search side to reuse them on the replace side by using escaped parenthesis :
``` head README.md  | sed 's/\(#*\)\(.*\)$/\1\2\1/'```

If you have multiple operations to perform you can either pipe them, or put them in a sed script (script.sed, with executable rights)
``` #!/bin/sed -f
s/#/=/g
s/^\(=*\)\(.*\)/\1\2 \1/
```
And execute the script on a file
```script.sed README.md```

```/``` delimiter for commands can be replaced with ```:,#%``` (non exhaustive)


## grep
`grep` stands for Get Regular ExPression, it outputs the line from stdin or specified files matching a given pattern (regular expression, aka regexp)
TODO

## find
find the set of files matching the request
TODO

## awk
Often used to manipulate columns from a file of standard input.
TODO

## sort
Sort lines
TODO

## screen
Terminal emulator, allows user to open a session on a computer, and reattach to that same session remotely
screen is resilient to broken connection, logout from main session. Unfortunately it is not yet resilient to power outage/reboot.
TODO

## bc
command line calculator
TODO

## xargs
transform standard input and turn it into arguments to provided command
TODO

## bash shortcut
TODO

## watch
Repeatedly run a command to monitor its output
TODO

## df
Reports usage of partitions mounted
TODO

## du
Stands for Disk Usage, reports size used by current directory
TODO

## man
Stands for MANual, gives manual page of provided command/function

## tar
Stands for Tape ARchive, while most of you were shitting in diapers, files were saved on tape.
`tar` is used to archive files into a .tar file

## vim
THE BEST EDITOR IN TOWN

## emacs
Escape-Meta-Alt-Control-Shift
Eight Mega And Constantly Swapping (this was funny back in the 80 when computers suffered from a lack of RAM)
