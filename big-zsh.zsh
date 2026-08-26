# Entry point for Big Zsh. This file must be sourced by Zsh.
if [[ -n ${BIG_ZSH_LOADED:-} ]]; then
    return 0
fi
typeset -g BIG_ZSH_LOADED=1
typeset -g BIG_ZSH_DIR=${${(%):-%N}:A:h}

if [[ -z ${functions[mzc_termsupport_precmd]:-} ]]; then
    [[ -r /usr/share/zsh/biglinux-zsh-config ]] &&
        source /usr/share/zsh/biglinux-zsh-config
fi
if [[ -z ${functions[prompt_powerlevel10k_setup]:-} && -z ${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+x} ]]; then
    [[ -r /usr/share/zsh/biglinux-zsh-prompt ]] &&
        source /usr/share/zsh/biglinux-zsh-prompt
fi

for big_zsh_module in "$BIG_ZSH_DIR"/[0-9][0-9]-*.zsh(N); do
    source "$big_zsh_module"
done
unset big_zsh_module

[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/big-zsh/local.zsh" ]] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/big-zsh/local.zsh"

return 0
