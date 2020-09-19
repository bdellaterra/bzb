
## BZB: Browse files using fzf.
 

### usage:

```
bzb [options] [target file or directory]
```

If no target specified start in the current directory.


### Key mappings are as follows:

KEYMAP      | DESCRIPTION                                                       | ACTION
------------|-------------------------------------------------------------------|------------------------
escape      | exit file browser                                                 | 
ctrl-c      | exit file browser                                                 | 
enter       | enter directory or edit file                                      | 
right       | enter directory or edit file                                      | enter
alt-l       | enter directory or edit file                                      | enter2
left        | go to parent directory (not moving past base directory)           | back
alt-h       | go to parent directory (not moving past base directory)           | back2
alt-q       | (q)uick-launch targets using native client                        | launch
alt-/       | grep for pattern specified at prompt ('left' will exit grep mode) | grep
ctrl-g      | toggle (g)rep mode preserving pattern / cancel submenu or prompt  | toggle-grep
alt-m       | (m)ove targets to directory named at prompt                       | move
alt-r       | (r)ename targets in current directory                             | rename
ctrl-alt-m  | (m)ove/rename targets into directory named at prompt              | move-rename
alt-x       | delete targets                                                    | delete
alt-c       | (c)opy targets to directory named at prompt                       | copy
ctrl-alt-c  | (c)opy/rename targets into directory named at prompt              | copy-rename
alt-t       | create (a.k.a. "(t)ouch") file named at prompt                    | create-file
ctrl-alt-t  | create/edit file named at prompt                                  | create-edit-file
alt-e       | create/edit file named at prompt                                  | create-edit-file2
alt-d       | create (d)irectory named at prompt                                | create-dir
ctrl-alt-d  | create/enter (d)irectory named at prompt                          | create-enter-dir
alt-b       | toggle (b)ookmark for current directory                           | toggle-bookmark
ctrl-alt-b  | (b)ookmark targets                                                | bookmark-targets
ctrl-alt-u  | (u)nbookmark selected directories                                 | unbookmark
alt-right   | go to next bookmarked directory                                   | next-bookmark
alt-n       | go to next bookmarked directory                                   | next-bookmark2
alt-left    | go to previous bookmarked directory                               | prev-bookmark
alt-p       | go to previous bookmarked directory                               | prev-bookmark2
alt-up      | select and enter bookmarked directory                             | select-bookmark
ctrl-alt-k  | select and enter bookmarked directory                             | select-bookmark2
alt-down    | select and enter bookmarked directory under current directory     | select-nested-bookmark
ctrl-alt-j  | select and enter bookmarked directory under current directory     | select-nested-bookmark2
alt-a       | switch between current and (a)lternate directory                  | enter-alt-dir
ctrl-alt-a  | set (a)lternate directory (default for copy/move prompts)         | set-alt-dir
alt-u       | switch between current and base directory                         | enter-base-dir
alt-z       | switch between current and (p)revious directory                   | enter-prev-dir
alt-g       | (g)o to directory named at prompt                                 | prompt-dir
ctrl-alt-g  | set new base directory at prompt and (g)o to it                   | set-base-dir
ctrl-alt-l  | toggle visibility of the statusline                               | toggle-statusline
ctrl-alt-h  | toggle (v)isibility of hidden files                               | toggle-hide
ctrl-alt-i  | toggle visibility of (i)gnored files (if supported)               | toggle-ignore
ctrl-alt-n  | toggle listing (n)ested vs. only top-level files                  | toggle-nested
ctrl-alt-s  | toggle (s)orting of results (affects performance)                 | toggle-sort
ctrl-/      | toggle sorting of nested results (affects performance)            | toggle-nested-sort
ctrl-alt-o  | toggle sort (o)rder ascending/descending                          | toggle-sort-order
ctrl-alt-r  | (r)estore initial view/sort settings                              | restore-settings
ctrl-alt-v  | toggle visibility of pre(v)iew pane                               | toggle-preview
alt-y       | load session from file named at prompt                            | load-session
ctrl-alt-y  | save session to file named at prompt                              | save-session


### Command line options are as follows:

OPTIONS                            | EFFECT
-----------------------------------|-------------------------------------------
--help                             | Show this help text
--once,-o                          | Exit browser after editing a file
--color,-c                         | Show colorized output
--nested,-n                        | List nested files/directories at start
--no-hide,-H                       | Show hidden files/directories at start
--no-ignore,-I                     | Show ignored files/directories at start
--reverse,-r                       | Reverse the normal sort order
--no-sort,-S                       | Disable sorting of files/directories
--no-nested-sort,-NS               | Disable sorting of nested files/directories
--no-edit,-E                       | Log selections to file instead of launching editor
--no-preview,-P                    | Disable preview pane that shows file/directory contents
--no-statusline,-L                 | Disable statusline that shows current state of various settings
--autosave-session,-as             | Save bookmarks and view/sort settings continuously
--autoload-session,-al             | Load bookmarks and view/sort settings on entering base directory
--grep=PATTERN,-g=PATTERN          | Start in grep mode, searching files for specified pattern
--base-directory=DIR,-bd=DIR       | Specify base directory instead of deriving it from target argument
--alternate-directory=DIR,-ad=DIR  | Initialize alternate directory at start
--data-directory=DIR,-dd=DIR       | Specify directory for storing sessions and other data

Most options can be inverted by reversing uppercase/lowercase for the short form or adding/removing
the 'no-' prefix for the long form. Additional options will be passed on to fzf, with the form using
an equals sign '=' required for options that take values. (e.g. '--query=STR' not '-q STR')

