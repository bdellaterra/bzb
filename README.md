
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
alt-q       | quick-launch targets using native client                          | launch
alt-/       | grep for pattern specified at prompt ('left' will exit grep mode) | grep
ctrl-g      | grep for pattern specified at prompt ('left' will exit grep mode) | grep2
alt-m       | move targets to directory named at prompt                         | move
alt-r       | rename targets in current directory                               | rename
ctrl-alt-m  | move/rename targets into directory named at prompt                | move-rename
ctrl-alt-r  | move/rename targets into directory named at prompt                | move-rename2
alt-x       | delete targets                                                    | delete
alt-c       | copy targets to directory named at prompt                         | copy
ctrl-alt-c  | copy/rename targets into directory named at prompt                | copy-rename
alt-e       | create/edit file named at prompt                                  | create-edit-file
alt-f       | create file without editing                                       | create-file
alt-d       | create directory named at prompt                                  | create-dir
ctrl-alt-d  | create/enter directory named at prompt                            | create-enter-dir
alt-b       | bookmark target directories                                       | bookmark-targets
ctrl-alt-b  | bookmark current directory                                        | bookmark-current-dir
alt-u       | unbookmark selected directories                                   | unbookmark-dirs
ctrl-alt-u  | unbookmark current directory                                      | unbookmark-current-dir
alt-right   | go to next bookmarked directory                                   | next-bookmark
ctrl-alt-l  | go to next bookmarked directory                                   | next-bookmark2
alt-left    | go to previous bookmarked directory                               | prev-bookmark
ctrl-alt-h  | go to previous bookmarked directory                               | prev-bookmark2
alt-up      | select and enter bookmarked directory                             | select-bookmark
ctrl-alt-k  | select and enter bookmarked directory                             | select-bookmark2
alt-down    | select and enter bookmarked directory under current directory     | select-nested-bookmark
ctrl-alt-j  | select and enter bookmarked directory under current directory     | select-nested-bookmark2
alt-s       | set alternate directory (default for copy/move prompts)           | set-alt-dir
alt-a       | switch between current and alternate directory                    | enter-alt-dir
alt-z       | switch between current and base directory                         | enter-base-dir
alt-p       | switch between current and previous directory                     | enter-prev-dir
alt-g       | go to directory named at prompt                                   | prompt-dir
ctrl-alt-g  | set new base directory at prompt and go to it                     | set-base-dir
ctrl-alt-p  | toggle visibility of preview pane                                 | toggle-preview
alt-i       | toggle visibility of ignored files (if supported)                 | toggle-ignored
alt-v       | toggle visibility of hidden files                                 | toggle-hidden
alt-n       | toggle listing nested vs. only top-level files                    | toggle-nested
alt-o       | toggle sort order ascending/descending                            | toggle-sort-order
ctrl-alt-s  | toggle sorted/unsorted results (affects performance)              | toggle-sort
ctrl-alt-n  | restore normal view settings (nested/hidden/ignored)              | reset-view
alt-y       | load session from file named at prompt                            | load-session
ctrl-alt-y  | save session to file named at prompt                              | save-session


### Command line options are as follows:

OPTIONS                            | EFFECT
-----------------------------------|-------------------------------------------
--help,-h                          | Show this help text
--once,-o                          | Exit browser after editing a file
--color,-c                         | Show colorized output
--recursive,-r                     | List nested files/directories at start
--hidden,-H                        | Show hidden files/directories at start
--no-ignore,-I                     | Show ignored files/directories at start
--no-sort,-S                       | Disable sorting of files/directories
--reverse-sort,-R                  | Reverse the normal sort order
--no-edit,-E                       | Disable launch of editor and just log selection to file
--no-preview,-P                    | Disable preview pane that shows file/directory contents
--no-toggle-status,-T              | Disable status header that shows current toggle settings
--autosave-session,-s              | Save bookmarks and view/sort settings continuously
--autoload-session,-l              | Load bookmarks and view/sort settings at start
--grep=PATTERN,-g=PATTERN          | Start in grep mode, searching files for specified pattern
--base-directory=DIR,-bd=DIR       | Specify a base directory instead of deriving it from target
--alternate-directory=DIR,-ad=DIR  | Initialize alternate directory at start

Any additional options will be passed to fzf.

