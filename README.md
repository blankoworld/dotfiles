# Les fichiers d'Olivier

## Description

Quelques fichiers de configuration possibles pour des outils quotidiens tels que : 

  * Tmux
  * Vim
  * Xorg
  * Zsh
  * etc.

D'autres viendront au fur et à mesure.

## Dépendances

Sont nécessaires : 

  * colordiff
  * dunst
  * elinks
  * exa
  * gartoon-redux (https://www.gnome-look.org/content/show.php?content=74841) : icônes mode cartoon :)
  * git-core
  * htop
  * kitty + ttf-fira-code (AUR) pour les fontes avec ligatures
  * mlocate
  * most
  * openbox OU i3wm
  * redshift
  * ripgrep
  * tmux
  * trizen
  * ttf-dejavu
  * vim + neovim
  * vim-airline + powerline-fonts (pour VIM)
  * xscreensaver
  * zsh + oh-my-zsh (Cf. https://github.com/robbyrussell/oh-my-zsh) + powerlevel10k (Cf. https://github.com/romkatv/powerlevel10k#oh-my-zsh)

## Cas de ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
cp dotfiles/zshrc ~/.zshrc
cp dotfiles/p10k.zsh ~/.p10k.zsh
```

## Cas d'i3

Nécessite : 

  * .profile pour rendre disponible $HOME/bin
  * .Xresources

Dépendances : 

  * gksu (pour éteindre/redémarrer le système à partir de polybar)
  * scrot
  * feh
  * i3-gaps (à la place d'i3)
  * rofi (pour le menu de lancement)
  * compton (pour la transparence et les ombres des fenêtres)
  * polybar (à la place de la barre d'état)
  * ttf-font-awesome-4 (pour afficher des icônes dans la barre d'état)
  * (optionnel) network-manager-applet (pour la configuration wifi)
  * pavucontrol (gestion du son)
  * wireless_tools pour l'affichage wifi dans polybar
  * clipit (presse-papier du bureau)
  * hamster-time-tracker (enregistrement des durées de travail)
  * httpie
  * nvm (pour zshrc qui demande cet outil)
  * dunst (pour notification bureau)

## À Configurer (avec un script bash ou autre)

  * .Xdefaults (nécessaire que pour urxvt)
  * .Xresources (thème dark solarized pour X)
  * .gitconfig
  * .gitignore_global
  * .gitmessage.txt
  * .i3status.conf
  * .profile
  * .tmux.conf
  * .vimrc
  * .xinitrc
  * .zprofile
  * .zsh
  * .zshenv
  * .zshrc
  * .p10k.zsh
  * [optionnel] environnement openbox
  * dossier .config
  * dossier bin
  * dossier zsh

Clavier FR avec la commande suivante : 

```
localectl --no-convert set-x11-keymap fr,fr pc104 oss,bepo grp:alt_shift_toggle
```

## Autologin

Cf. https://wiki.archlinux.org/index.php/Getty#Automatic_login_to_virtual_console

## Configuration de Git

```bash
git config --global commit.template ~/.gitmessage.txt 
```

## Selfie de la caméra avec mpv

```bash
mpv av://v4l2:/dev/video0
```

puis on appuie sur la touche **[s]**.

## Liens utiles

  * https://dotfiles.github.io/
  * https://github.com/svetlyak40wt/dotfiler
  * https://gist.github.com/NeoTheFox/afd26413899d6e0431f88546027144a6 (config kitty)
