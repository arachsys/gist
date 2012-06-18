__gist_complete() {
  local CMDS='clone delete describe destroy list ls private public rm'
  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=($(compgen -W "$CMDS" -- "$2"))
  elif [ $COMP_CWORD -eq 2 ]; then
    case ${COMP_WORDS[1]} in
      clone | delete | destroy | rm)
        COMPREPLY=($(compgen -W "$(gist list | cut -d ' ' -f 1)" -- "$2"))
        ;;
    esac
  fi
}

complete -F __gist_complete gist
