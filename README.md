# Big Zsh

Uma camada pessoal e opcional para usar Zsh no BigLinux, preservando a excelente experiência que o sistema já oferece.

O BigLinux cuida muito bem do terminal e já entrega configurações próprias para Bash e Zsh. Este projeto nasceu apenas de uma preferência pessoal pelo Zsh e acrescenta alguns atalhos e integrações ao ambiente oficial. Não pretende “corrigir”, substituir ou competir com o trabalho do BigLinux.

> Projeto comunitário independente, sem vínculo oficial com o BigLinux.

## Princípios

- usa a configuração e o prompt Zsh fornecidos pelo próprio BigLinux;
- não altera nem remove o Bash, o `.bashrc` ou os pacotes nativos;
- mantém `ls`, `cat`, `grep`, `find`, `du`, `df` e `ps` com o comportamento tradicional;
- adiciona ferramentas modernas por seus próprios nomes e atalhos opcionais;
- cria backup antes de alterar o `.zshrc`;
- pode ser removido sem desfazer a configuração original do sistema.

Zsh e Bash são shells diferentes, portanto não existe equivalência literal para toda construção interna. O objetivo aqui é preservar o fluxo de trabalho e deixar o Bash original sempre disponível. Para iniciar uma sessão Bash a qualquer momento, use `bash` ou o atalho `bash-native`.

## Compatibilidade

O projeto é direcionado ao **BigLinux atual**, baseado em Arch/Manjaro e com os arquivos oficiais abaixo instalados:

```text
/usr/share/zsh/biglinux-zsh-config
/usr/share/zsh/biglinux-zsh-prompt
```

Em outras distribuições, o instalador encerra sem modificar o sistema. Veja [COMPATIBILITY.md](COMPATIBILITY.md).

## Instalação

Revise os scripts antes de executá-los. O instalador usa `pacman` para dependências oficiais, pede `sudo` diretamente no terminal e nunca recebe senha por argumento.

```bash
git clone https://github.com/BrunodosSantosVaz/big-zsh.git ~/big-zsh
cd ~/big-zsh
./install-deps.sh
```

Depois, teste uma nova sessão:

```bash
zsh
```

Se estiver satisfeito e quiser tornar o Zsh o shell padrão:

```bash
chsh -s "$(command -v zsh)"
```

Essa última etapa é opcional. O Bash continua instalado e inalterado.

## O que é adicionado

- atalhos Git (`gs`, `ga`, `gc`, `gp`, `gl`);
- navegação (`..`, `...`, `mkcd` e zoxide quando disponível);
- funções seguras para backup, extração e consulta de porta;
- integração opcional com mise, fzf, bat e qalc;
- atalhos explícitos para ferramentas modernas:

| Atalho | Ferramenta | Comando tradicional preservado |
| --- | --- | --- |
| `l` / `ll` / `la` / `lt` | eza | `ls` |
| `rg` | ripgrep | `grep` |
| `fd` | fd | `find` |
| `dust` | dust | `du` |
| `duf` | duf | `df` |
| `procs` | procs | `ps` |
| `bat` | bat | `cat` |

O atalho de calculadora funciona quando `qalc` está instalado:

```zsh
= 2+2
```

## Configuração

O instalador acrescenta ao `.zshrc` apenas um bloco identificado:

```zsh
# >>> big-zsh >>>
source "/caminho/para/big-zsh/big-zsh.zsh"
# <<< big-zsh <<<
```

Configurações pessoais podem ficar em `~/.config/big-zsh/local.zsh`, que é carregado por último e não pertence ao repositório.

## Desinstalação

```bash
./uninstall.sh
```

O script remove somente o bloco gerenciado do `.zshrc`. Dependências e seus dados pessoais não são apagados automaticamente.

## Segurança e privacidade

Nenhuma credencial é necessária pelo projeto. Não passe senhas como argumento e não coloque tokens em arquivos `.zsh`. Consulte [SECURITY.md](SECURITY.md).

## Contribuindo

Contribuições respeitosas são bem-vindas. O objetivo é somar ao ecossistema BigLinux e oferecer uma opção a quem também prefere Zsh. Veja [CONTRIBUTING.md](CONTRIBUTING.md).

## Licença e marcas

O código deste repositório é disponibilizado sob a [Licença MIT](LICENSE). Dependências permanecem sob suas próprias licenças; consulte [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

BigLinux e os nomes de projetos de terceiros pertencem aos respectivos titulares. A menção serve apenas para indicar compatibilidade e atribuição. Este projeto não distribui os arquivos oficiais do BigLinux: ele utiliza os que já existem no sistema do usuário.

Feito por [Bruno Vaz](https://github.com/BrunodosSantosVaz), com admiração e respeito pelo trabalho da comunidade BigLinux.
