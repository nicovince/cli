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

### Go to someone else home directory
```
cd
# or
cd ~toto
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

### to a specific line
```
head -n +5
```

## tail
get the 10 last lines of a file (or stdin)

### specify number of lines
```
tail -5
tail -n 5
```

### from a specific line
```
tail -n +5
```

### Monitor a file on live
```tail -f <file>```

Particulary useful for non-rolling log files

Be aware -f file follow the inode and not the file.

```tail -F <file>```

Particulary useful for rolling log files


## basename
returns filename of path provided in argument

```
basename /path/to/foo
--> foo
```

pathname does not have to be a path to a valid file

## dirname
returns folder of given pathname

```
dirname /path/to/foo
--> /path/to
```

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

Use `--color=auto` to highlight your matches (`alias grep='grep --color=auto'`)

```grep ring text
grep "\<ring\>" text # Search for the word ring using word boundary patterns
grep "\<Ring\>" text
grep -w Ring text
grep "\<ring\>" text -i```

- `-l` if you are only interested in the filenames for which there is a match
- `-L` if you are only interested in the filenames for which there is no match
- `-H` to force grep to display filename
- `-h` to prevent grep from displaying filename
- `-c` to count number of lines matching (not number of match)
- `-o` display only the matching part `echo -e "foo bar\nfoooo" | grep fo* -o`
- `-v` display lines which do not match the pattern
- `-A 2` display two lines of context after the match
- `-B 2` display two lines of context before the match


## find
find the set of files matching the request

- pattern name
- type of file to search for (file, directory, ...)
- owner of the file
- group of the file
- file last access time
- file last modification time
- size of the file
- and many, many, many more

more infos : `man find` / google

## awk/gawk
Used to manipulate columns from a file or standard input and print it on standard output.

print second column :

```echo -e "1 2 3\n4 5 6" | gawk '{print "$2"}'```

`$0` stands for all columns.

more infos : https://linuxconfig.org/learning-linux-commands-awk


## sort
Sort lines of a file (or standard input) alphabetically

```cat text | sort```

You can specify which key can be used for sorting `-k`
```echo -e "alice 9\nbob 200\ncharlie 1200\ndoug 35" | sort -k 2```

By default 9 is higher than 1200, use `-n` for numerical sort

To sort values which uses K, M, G suffix, use the `-h` flag
```echo -e "alice 9K\nbob 200M\ncharlie 1200G\ndoug 35" | sort -k 2 -h```


## uniq
Suppress identical adjacent lines. Often used after a `sort` operation.


## screen
Terminal emulator, allows user to open a session on a computer, and reattach to that same session remotely
screen is resilient to broken connection, logout from main session. Unfortunately it is not yet resilient to power outage/reboot.

To reattach to a screen session, it must be detached first `-d` flag, and it is reattached with the `-r` flag. If no session exists, it will fail. Using `-RD` flags will starts a screen session if none exists.
```screen -RD```

You can have multiple screen session running, use `screen -ls` to list them, and specify which session you want to attach to after the reattach flag (`-R` or `-r`).

You can specify the name of a screen session with `-S flag`

```screen -S unicorn```

Inside screen, you can send commands to create, new tabs, scroll (one major drawback of screen is that by default, you can no longer use your terminal scrollbar to view the history). All screen commands starts with `ctrl-a` followed by a letter :
- `ctrl-a d` detach from your current screen session
- `ctrl-a c` creates a new tab with a shell
- `ctrl-a <space>` go to next tab
- `ctrl-a '"'` display list of available tabs, use arrow keys and enter to select one
- `ctrl-a A` prompt to rename current tab
- `ctrl-a 1` jump to tab number 1
- `ctrl-a <escape>` switch to history scrolling mode (copy-mode), use arrow keys, 'j', 'k' or 'page-up', 'page-down' to navigate. Type ':' to exit this mode.

## bc
command line calculator

By default it does not supports a lot of arithmetic functions (cos, sin, log, ...) but definitions can be provided.

it can read from stdin and respects operator precedence :

```
echo "5+5*3" | bc
20
 echo "(5+5)*3" | bc
30
```


## lftp
command line ftp, better than `ftp`, supports tab completion.
- `put file` send file to server
- `mput file1 file2` send list of files to server
- `get file` get file from server
- `mget file1 file2` get list of files from server
- `mirror directory` get full directory
- `mirror -R directory` send full directory
- `cd` change directory on server side
- `lcd` change directory on local side


## scp
Stands for Secure CoPy : copy a file to a remote ssh-able location

```
scp local_file user@remote:/location/on/remote/
scp user@remote:/location/on/remote/remote_file ./
```

## rsync
Synchronize two directories (one of them can be a remote). It analyse difference between the two directories and sends only new or modified files.

```
rsync -avz src_directory user@remote:/target/dir
```


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

You can highlight difference with previous output with `-d` flag,

```
watch -dc ls
```

## df
Reports disk usage of partitions mounted

use `-h` to get a numan readable size.

## du
Stands for Disk Usage, reports size used by files in current folder and sub-folders

If you are interested in the size of current folder, without the details of all the files use
```du -s```

Add `-h` flag to get a human readable size.

## man
Stands for MANual, gives manual page of provided command/function

- use `/pattern` to search forward for a particular pattern
- use `?pattern` to search backward for a particular pattern
- use `q` to quit

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


## iotop
`top` for input output operations


## wget
Web downloader, can download file or whole website


## convert
Part of `image-magick` tool suite, can be used to convert, crop, resize images


## diff
perform diff between files

```
diff file1 file2
diff -U2 file1 file2
```


## pushd/popd
used to push/pop directories into a stack for later use

```
pwd
--> /here
pushd .
cd /somewhere/else
pushd .
cd /another/place
popd
pwd
--> /somewhere/else
popd
pwd
--> /here
```


## lsof
list open files with processes


## tr
change set of character with another one

```
echo "hello" | tr "[a-z]" "[A-Z]"
echo "un deux trois" | tr " " "\n"
echo "un deux trois" | tr " " "\n" | tr "\n" " "
```


## tee
sends standard input to standard output and to log file

```
ls | tee log.txt
```


## sleep
Wait given amount of time, understands time quantifiers (s, m, h)

```
sleep 3m; echo "wait a little before starting command"
```

## at
run commands read on stdin at given time

```
echo your_command.sh | at 19:00
```

## cron
Used to execute schedule commands

You can define the period of execution of your command with a fine granularity (every five minutes, every third day of each month, ...)

```
crontab -l # list schedule commands
crontab -e # edit list of schedule commands
```
Google / http://www.adminschoice.com/crontab-quick-reference

