
## BZB: Browse files using fzf.
 

### usage:

```
bzb [options] [target file or directory]
```

If no target specified start in the current directory.


### Options:

LONG/SHORT OPTION                  | EFFECT
-----------------------------------|-------------------------------------------------------------------
--help                             | Show this help text
--color,-c                         | Show colorized output
--nested,-n                        | List nested files/directories at start
--no-hide,-H                       | Show hidden files/directories at start
--no-ignore,-I                     | Show ignored files/directories at start
--reverse,-O                       | Reverse the normal sort order
--no-sort,-S                       | Disable sorting of files/directories (affects performance)
--no-nested-sort,-NS               | Disable sorting of nested files/directories (affects performance)
--no-statusline,-L                 | Disable statusline that shows current state of various settings
--no-preview,-V                    | Disable preview pane that shows file/directory contents
--no-persist,-P                    | Exit browser after editing a file
--no-edit,-E                       | Log selections to file instead of launching editor
--autosave-history,-ah             | Save queries so Ctrl-p and Ctrl-n will cycle through search history
--autoload-query,-aq               | Restore last query used in a directory upon entering it
--autosave-session,-as             | Save bookmarks and view/sort settings continuously
--autoload-session,-al             | Load bookmarks and view/sort settings on entering base directory
--autorecord,-ar                   | Enable automatically recording actions to a file at start
--autoplay,-ap                     | Enable automatically playing actions from a file at start
--recording-file=FILE,-rf=FILE     | Specify target file for saving recorded actions
--playback-file=FILE,-pf=FILE      | Specify source file for playing recorded actions
--grep=PATTERN,-g=PATTERN          | Start in grep mode, searching files for specified pattern
--base-directory=DIR,-bd=DIR       | Specify base directory instead of deriving it from target argument
--alternate-directory=DIR,-ad=DIR  | Initialize alternate directory at start
--data-directory=DIR,-dd=DIR       | Specify directory for storing sessions and other data

Most options can be inverted by reversing uppercase/lowercase for the short form or adding/removing
the 'no-' prefix for the long form. Additional options will be passed on to fzf, with the long form using
an equals sign required for options that take values, unless no unescaped spaces are used in the assignment.
(e.g. '--query=STR' or '-qSTR', not '-q STR')


### Key mappings:

KEY         | DESCRIPTION                                                          | ACTION
------------|----------------------------------------------------------------------|-----------------------------|
ctrl-c      | exit file browser                                                    | 
escape      | clear search query / exit file browser if query is blank             | 
enter       | enter directory or edit file                                         | 
right       | enter directory or edit file                                         | enter
left        | go to parent directory (not moving past base directory)              | back
alt-q       | (q)uick-launch targets using native client                           | launch
alt-f       | grep/(f)ind pattern specified at prompt ('left' will exit grep mode) | grep
ctrl-g      | cancel submenu or prompt / toggle (g)rep mode preserving pattern     | toggle-grep
alt-m       | (m)ove targets to directory named at prompt                          | move
alt-r       | (r)ename targets in current directory                                | rename
ctrl-alt-m  | (m)ove/rename targets into directory named at prompt¹                | move-rename
alt-x       | delete targets                                                       | delete
alt-c       | (c)opy targets to directory named at prompt                          | copy
ctrl-alt-c  | (c)opy/rename targets into directory named at prompt                 | copy-rename
alt-t       | create (a.k.a. "(t)ouch") file named at prompt                       | create-file
alt-e       | create and (e)dit file named at prompt                               | create-edit-file
alt-d       | create (d)irectory named at prompt                                   | create-dir
ctrl-alt-d  | create/enter (d)irectory named at prompt                             | create-enter-dir
alt-b       | toggle (b)ookmark for current directory                              | toggle-bookmark
ctrl-alt-b  | (b)ookmark targets                                                   | bookmark-targets
ctrl-alt-u  | (u)nbookmark selected directories¹                                   | unbookmark
alt-left    | jump backward through list of bookmarks                              | prev-bookmark
alt-k       | jump bac(k)ward through list of bookmarks                            | prev-bookmark2
alt-right   | jump forward through list of bookmarks                               | next-bookmark
alt-j       | (j)ump forward through list of bookmarks                             | next-bookmark2
alt-up      | select and enter bookmarked directory¹                               | select-bookmark
ctrl-alt-k  | select and enter bookmarked directory¹                               | select-bookmark2
alt-down    | select and enter bookmarked directory under current directory¹       | select-nested-bookmark
ctrl-alt-j  | select and enter bookmarked directory under current directory¹       | select-nested-bookmark2
alt-a       | switch between current and (a)lternate directory                     | enter-alt-dir
ctrl-alt-a  | set (a)lternate directory (default for copy/move prompts)            | set-alt-dir
alt-u       | go to base directory, or if at base move it (u)p one level           | up-base-dir
alt-p       | switch between current and (p)revious directory                      | enter-prev-dir
alt-g       | (g)o to directory named at prompt                                    | prompt-dir
ctrl-alt-g  | set new base directory at prompt and (g)o to it                      | prompt-base-dir
alt-y       | copy (a.k.a. (y)ank) targets to clipboard                            | yank-targets
ctrl-alt-y  | copy (a.k.a. (y)ank) current directory to clipboard                  | yank-dir
alt-l       | toggle visibility of the status(l)ine                                | toggle-statusline
alt-h       | toggle visibility of (h)idden files                                  | toggle-hide
alt-i       | toggle visibility of (i)gnored files (if supported)                  | toggle-ignore
alt-n       | toggle listing (n)ested vs. only top-level files                     | toggle-nested
alt-s       | toggle (s)orting of results (affects performance)                    | toggle-sort
ctrl-alt-n  | toggle sorting of (n)ested results (affects performance)             | toggle-nested-sort
alt-o       | toggle sort (o)rder ascending/descending                             | toggle-sort-order
ctrl-alt-i  | restore (i)nitial view/sort settings                                 | initial-settings
alt-v       | toggle visibility of pre(v)iew pane                                  | toggle-preview
ctrl-alt-r  | (r)ecord actions to file named at prompt¹                            | toggle-recording
ctrl-alt-p  | (p)layback actions from file named at prompt¹                        | toggle-playback
ctrl-alt-l  | (l)oad session from file named at prompt                             | load-session
ctrl-alt-s  | (s)ave session to file named at prompt                               | save-session
ctrl-alt-t  | open a new (t)erminal/shell in current directory²                    | terminal
ctrl-alt-x  | e(x)ecute a single shell command in current directory²               | execute

Overrides for action/key bindings can be set using environment variable BZB_BIND.
For example, the 'launch' and 'enter' bindings can be swapped by invoking bzb with command:
> BZB_BIND="[enter]=alt-q [launch]=right" bzb

1. Specified actions are not recordable
2. Each terminal command will be recorded as an 'execute' action
