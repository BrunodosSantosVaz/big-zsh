# GRC wrapping is opt-in because wrappers can change command behavior.
if [[ ${BIG_ZSH_ENABLE_GRC:-0} == 1 ]] && command -v grc-rs >/dev/null 2>&1; then
    for big_zsh_grc_command in ping traceroute ip ss diff; do
        command -v "$big_zsh_grc_command" >/dev/null 2>&1 &&
            alias "$big_zsh_grc_command=grc-rs $big_zsh_grc_command"
    done
    unset big_zsh_grc_command
fi
