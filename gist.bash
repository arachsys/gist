__gist_complete() {
  local CMDS='clone delete describe destroy list ls private public rm'
  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=($(compgen -W "$CMDS" -- "$2"))
  elif [ $COMP_CWORD -eq 2 ] && [ "${COMP_WORDS[1]}" = "clone" ]; then
    COMPREPLY=($(compgen -W "$(gist list | cut -d ' ' -f 1)" -- "$2"))
  elif [ "${COMP_WORDS[1]}" = "delete" ] \
         || [ "${COMP_WORDS[1]}" = "destroy" ] \
         || [ "${COMP_WORDS[1]}" = "rm" ]; then
    COMPREPLY=($(compgen -W "$(gist list | cut -d ' ' -f 1)" -- "$2"))
  fi
}

complete -F __gist_complete gist
