#!/bin/bash
set -e

BASE_DIR="${1:-$PWD}"  # Target current directory if no argument given
SHALLOW=1              # Start with only top-level files/directories displayed

# Prefer fd over find so ignored files are not listed
if command -v fd &>/dev/null; then
  RECURSIVE_FIND='fd --hidden'
  SHALLOW_FIND='fd --hidden --max-depth 1 --exec echo {/}'
else
  RECURSIVE_FIND='find . ! -name "." | sed "s:^\./::"'
  SHALLOW_FIND='find . -maxdepth 1 ! -name "." -execdir basename "{}" \;'
fi

declare -A KEYMAP
KEYMAP['right']="enter directory or edit file"
KEYMAP['left']="cd to parent directory"
KEYMAP['ctrl-r']="move targets"
KEYMAP['alt-r']="rename targets"
KEYMAP['ctrl-d']="delete targets"
KEYMAP['alt-d']="move and rename targets"
KEYMAP['ctrl-s']="copy targets"
KEYMAP['alt-s']="copy and rename targets"
KEYMAP['ctrl-b']="set base directory"
KEYMAP['alt-b']="set alternate directory"
KEYMAP['ctrl-\']="cd to alternate directory"
KEYMAP['ctrl-/']="cd to deeper directory using cache"
KEYMAP['alt-h']="toggle display of hidden files"
KEYMAP['alt-i']="toggle display of ignored files"
KEYMAP['alt-a']="toggle all nested vs. only top-level files"

KEYS="$(printf ",%s" "${!KEYMAP[@]}" | cut -c2-)"
KEY_USAGE="$(for k in "${!KEYMAP[@]}"; do echo "$k - ${KEYMAP[$k]}"; done)"

usage() {
cat <<USAGE
usage: b [options] [target file or directory]

Browse files using fzf. If no target specified start in current directory.

Keymaps are as follows:
escape or ctrl-c - exit file browser
enter - enter directory or edit file
$(echo "$KEY_USAGE" | sort)

options:
--shallow-find=COMMAND    Command to list only top-level files/directories
                          default: $SHALLOW_FIND
--recursive-find=COMMAND  Command to list nested files/directories
                          default: $RECURSIVE_FIND

Any additional options will be passed to fzf.
USAGE
}

for arg in "$@"; do
  case $arg in
    -h|--help) usage; exit 0 ;;
    --shallow-find=*) SHALLOW_FIND="${arg#*=}"; shift ;;
    --recursive-find=*) RECURSIVE_FIND="${arg#*=}"; shift ;;
    # Save remaining options for fzf with quoting preserved
    -*) OPTS+=("${arg%%=*}=\"${arg#*=}\""); shift ;;
  esac
done

main() {
  if [[ $# -eq 1 ]]; then
    target="$1"
    if [[ -d "$target" ]]; then
      cd "$target"
    else
      [[ -n "$target" ]] && "${EDITOR:vi}" "$target"
    fi
  elif [[ $# -gt 1 ]]; then
    EDIT="${EDITOR:vi}"
    for f in "$@"; do
      EDIT="$EDIT \"$f\""
    done
    bash -c "$EDIT"
  fi

  # CYCLE INTO FZF
  [[ $SHALLOW ]] && FIND="$SHALLOW_FIND" || FIND="$RECURSIVE_FIND"
  FZF="fzf --multi --expect='$KEYS' ${OPTS[@]}"
  { read command; mapfile -t targets; } < <(bash -c "$FIND" | bash -c "$FZF")

  # Use Escape or ctrl-c to exit
  [[ "${#targets[@]}" -eq 0 ]] && break

  case $command in
    # Use alt-a to toggle showing "all" nested files/directories
    # vs. only those at top-level
    alt-a)
      [[ $SHALLOW ]] && unset SHALLOW || SHALLOW=1
      targets=()
    ;;

    # Use ctrl-r to move targets
    ctrl-r)
      read -ep 'Move to Directory: ' -i "${ALT_DIR:-$BASE_DIR}" DIR
      [[ -n "$DIR" ]] && mv -i "${targets[@]}" "$DIR"
      targets=()
    ;;

    # Use alt-r to rename targets
    alt-r)
      for t in "${targets[@]}"; do
        if [[ -r "$t" ]]; then
          read -ep 'Move/Rename File: ' -i "mv $t ${ALT_DIR:-.}/$t" RENAME
          [[ -n "$RENAME" ]] && bash -c "$RENAME"
        fi
      done
      targets=()
    ;;

    # Use ctrl-d to delete targets
    ctrl-d)
      REMOVE="rm -rI ${targets[@]}"
      bash -c "$REMOVE"
      targets=()
    ;;

    # Use alt-d to move and rename targets
    alt-d)
      read -ep 'Move/Rename to Directory: ' -i "${ALT_DIR:-$BASE_DIR}" DIR
      if [[ -n "$DIR" ]]; then
        for t in "${targets[@]}"; do
          if [[ -r "$t" ]]; then
            read -ep 'Move/Rename File: ' -i "mv $PWD/$t $DIR/$t" MVRENAME
            [[ -n "$MVRENAME" ]] && bash -c "$MVRENAME"
          fi
        done
      fi
      targets=()
    ;;

    # Use ctrl-s to copy/save targets
    ctrl-s)
      read -ep 'Copy to Directory: ' -i "${ALT_DIR:-$BASE_DIR}" DIR
      [[ -n "$DIR" ]] && cp -ir "${targets[@]}" "$DIR"
      targets=()
    ;;

    # Use alt-s to copy and rename targets
    alt-s)
      read -ep 'Copy/Rename to Directory: ' -i "${ALT_DIR:-$BASE_DIR}" DIR
      if [[ -n "$DIR" ]]; then
        for t in "${targets[@]}"; do
          if [[ -r "$t" ]]; then
            read -ep 'Copy/Rename File: ' -i "cp $PWD/$t $DIR/$t" RENAME
            [[ -n "$COPY" ]] && bash -c "$COPY"
          fi
        done
      fi
      targets=()
    ;;

    # Use ctrl-d to create a directory
    # Use alt-d to create a directory and cd to it immediately
    ctrl-d|alt-d)
      targets=()
      read -p "Create directory: " target
      if [[ -n "$target" ]]; then
        mkdir -p "$target"
        [[ "$command" = 'alt-d' ]] && targets=("$target")
      fi
    ;;

    # Use ctrl-f to create a file
    # Use alt-f to create a file and edit it immediately
    ctrl-f|alt-f)
      targets=()
      read -p "Create file: " target
      if [[ -n "$target" ]]; then
        mkdir -p "$(dirname "$target")" && touch "$target"
        [[ "$command" = 'alt-f' ]] && targets=("$target")
      fi
    ;;

    # Use left arrow to move up a directory (not past initial directory)
    left)
      echo "$PWD"
      targets=()
      [[ "$PWD" != "$BASE_DIR" ]] && targets=("..")
    ;;

    # Use enter (parsed as empty string) or right arrow for default action
  esac

  main "${targets[@]}"
}

# Default initial target is current directory
main "$BASE_DIR"
