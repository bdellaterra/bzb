
## BZB: Browse files using fzf.
 

### usage:

```
bzb [options] [target file or directory]
```

If no target specified start in the current directory.


### Key mappings are as follows:

Key         | Action
------------|------------------------------------------------------------------
escape      | exit file browser
ctrl-c      | exit file browser
enter       | enter directory or edit file
right       | enter directory or edit file
left        | go to parent directory (not moving past base directory)
alt-enter   | quick-launch targets using native client
alt-q       | quick-launch targets using native client
alt-r       | rename targets in current directory
alt-m       | move targets to directory named at prompt
ctrl-alt-m  | move/rename targets into directory named at prompt
alt-x       | delete targets
alt-c       | copy targets to directory named at prompt
ctrl-alt-c  | copy/rename targets into directory named at prompt
alt-e       | create/edit file named at prompt
alt-f       | create file without editing
alt-d       | create directory named at prompt
ctrl-alt-d  | create/enter directory named at prompt
alt-b       | bookmark target directories
ctrl-alt-b  | un-bookmark target directories
alt-w       | bookmark current working directory
ctrl-alt-w  | un-bookmark current working directory
alt-right   | go to next bookmarked directory
alt-l       | go to next bookmarked directory
alt-left    | go to previous bookmarked directory
alt-h       | go to previous bookmarked directory
alt-up      | select and enter bookmarked directory
alt-k       | select and enter bookmarked directory
alt-down    | select and enter bookmarked directory under current directory
alt-j       | select and enter bookmarked directory under current directory
alt-u       | go up to base directory
alt-g       | go to directory named at prompt
ctrl-alt-g  | set new base directory at prompt and go to it
alt-a       | toggle between current and alternate directory
alt-z       | set alternate directory (default for copy/move prompts)
alt-p       | go to previous directory
alt-/       | grep for pattern specified at prompt ('left' will exit grep mode)
alt-n       | toggle listing nested vs. only top-level files
alt-i       | toggle visibility of ignored files (if supported)
alt-v       | toggle visibility of hidden files
ctrl-alt-p  | toggle visibility of preview pane
alt-o       | toggle between ascending/descending sort order
ctrl-alt-o  | toggle whether sorting is enabled/disabled (affects performance)
alt-s       | load session from file named at prompt
ctrl-alt-s  | save session to file named at prompt
ctrl-alt-r  | reset initial view/sort settings
ctrl-alt-u  | kill all bookmarks (except base directory)


### Command line options are as follows:

Options                            | Effect
-----------------------------------|-------------------------------------------
--help,-h                          | Show this help text
--grep,-g                          | Start in grep mode
--once,-o                          | Exit browser after editing a file
--color,-c                         | Show colorized output
--recursive,-r                     | Show nested files/direcories at start
--hidden,-H                        | Show hidden files/direcories at start
--no-ignore,-I                     | Show ignored files/direcories at start
--no-preview,-P                    | Disable preview pane that shows file/directory contents
--no-sort,-S                       | Disable sorting of files/directories
--reverse-sort,-R                  | Reverse the normal sort order
--auto-save-session,-s             | Save bookmarks and view/sort settings continuously
--auto-load-session,-l             | Load bookmarks and view/sort settings at start
--sort=CMD,-so=CMD                 | Command to sort files/directories
--shallow-find=CMD,-sf=CMD         | Command to list only top-level files/directories
--recursive-find=CMD,-rf=CMD       | Command to list nested files/directories
--file-preview=CMD,-fp=CMD         | Command to preview currently focused file
--directory-preview=CMD,-dp=CMD    | Command to preview currently focused directory
--shallow-grep=CMD,-sg=CMD         | Command to grep for pattern in top-level files/directories
--recursive-grep=CMD,-rg=CMD       | Command to grep for pattern recursively
--grep-preview=CMD,-gp=CMD         | Command to preview grep results for currently focused file
--quick-launch=CMD,-ql=CMD         | Command to launch files/directories using os-native client
--base-directory=DIR,-bd=DIR       | Specify a base directory instead of deriving it from target
--alternate-directory=DIR,-ad=DIR  | Initialize alternate directory at start

Any additional options will be passed to fzf.
