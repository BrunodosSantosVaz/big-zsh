#!/usr/bin/env bash
set -Eeuo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -r /etc/os-release ]]; then
    printf 'Não foi possível identificar o sistema.\n' >&2
    exit 1
fi
# shellcheck disable=SC1091
source /etc/os-release
if [[ "${ID:-}" != biglinux ]]; then
    printf 'Este instalador é exclusivo para BigLinux (sistema detectado: %s).\n' "${PRETTY_NAME:-desconhecido}" >&2
    exit 1
fi
for required_file in /usr/share/zsh/biglinux-zsh-config /usr/share/zsh/biglinux-zsh-prompt; do
    if [[ ! -r "$required_file" ]]; then
        printf 'Arquivo oficial do BigLinux não encontrado: %s\n' "$required_file" >&2
        exit 1
    fi
done

packages=(zsh eza bat ripgrep fd dust duf procs hyperfine fzf zoxide git-delta lazygit libqalculate)
missing=()
for package in "${packages[@]}"; do
    pacman -Q "$package" >/dev/null 2>&1 || missing+=("$package")
done

if (( ${#missing[@]} )); then
    printf 'Pacotes que serão instalados dos repositórios configurados:\n  %s\n' "${missing[*]}"
    sudo pacman -S --needed "${missing[@]}"
else
    printf 'Todas as dependências já estão instaladas.\n'
fi

"$project_dir/setup-zshrc.sh"
printf '\nInstalação concluída. Teste com: zsh\n'
printf 'Para tornar o Zsh padrão depois do teste: chsh -s "$(command -v zsh)"\n'
