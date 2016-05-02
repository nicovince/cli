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
```
sed -i 's/search/replace/g' filename
sed -i.bak 's/search/replace/g' filename
```

Sed can memorize patterns on the search side to reuse them on the replace side by using escaped parenthesis :
```head README.md  | sed 's/\(#*\)\(.*\)$/\1\2\1/'```

If you have multiple operations to perform you can either pipe them, or put them in a sed script (script.sed, with executable rights)
```
#!/bin/sed -f
s/#/=/g
s/^\(=*\)\(.*\)/\1\2 \1/
```

And execute the script on a file

```script.sed README.md```

```/``` delimiter for commands can be replaced with ```:,#%``` (non exhaustive)

tutorial : http://www.grymoire.com/Unix/Sed.html

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
transform standard output of a command and and turn it into arguments to a piped command

remove files containing a pattern

```grep "pattern" -l | xargs rm -i```

By default, arguments are pushed at the end of the command, you may want to insert them in the middle :

```grep "pattern" -l | xargs -I{} cp {} destination_folder```

## bash shortcuts
- `ctrl-a` go to beginning of the line
- `ctrl-e` go to end of the line
- `ctrl-u` remove characters from cursor to beginning of the line
- `ctrl-k` remove characters from cursor to end of the line
- `ctrl-w` remove previous word
- `ctrl-y` paste characters removed with previous ctrl-command
- `alt-b` move cursor backward by a word
- `alt-f` move cursor forward by a word
- `ctrl-b` move cursor backward by a character
- `ctrl-f` move cursor forward by a character

Those shortcuts can be used in many programs (which uses readline library)

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

use `/pattern` to search forward for a particular pattern 
use `?pattern` to search backward for a particular pattern 
use `q` t quit

```
man man
man woman
```

## tar
Stands for Tape ARchive, a little while ago, the main support for storage were tapes. It is still used for backup solutions.

`tar` is used to archive files into a .tar file

```tar cf archive.tar <list of files>```

You can add compression with `z` or `j` flag, in that case you should suffix your archive with respectively `.gz` or `bz2`

`tar czf archive.tar.gz <list of files>```

to extract simply replace `c` with `x`

## vim
THE BEST EDITOR IN TOWN

## emacs
Escape-Meta-Alt-Control-Shift
Eight Mega And Constantly Swapping (this was funny back in the 80 when computers suffered from a lack of RAM)
