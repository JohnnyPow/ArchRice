#!/bin/sh

date=$(date +%F_%H%M%S)
mkdir -p ~/.rice/backups/$date && cd "$_"

remove_file() {
  if [[ -f ~/$1 ]]; then
    mkdir -p ./$(dirname $1) && cp ~/$1 $1
    rm ~/$1
  fi
}

deploy_file() {
  mkdir -p ./$(dirname $1) && cp ~/$2 $1
  mkdir -p ~/$(dirname $2)
  ln -sf ~/.rice/home/$1 ~/$2
}

deploy_directory() {
  cp -rL ~/$2 ./$1
  mkdir -p ./$(dirname $1) && cp -r ~/$2 $1
  rm -rf ~/$2
  ln -sfT ~/.rice/home/$1 ~/$2
}

deploy_file zsh/zshrc .zshrc
deploy_file vim/vimrc .vimrc
deploy_file i3blocks/config .config/i3blocks/config
deploy_file imwheelrc .imwheelrc
deploy_file bashrc .bashrc
deploy_file urlview .urlview
deploy_file Xdefaults .Xdefaults
deploy_file xinitrc .xinitrc
deploy_file xprofile .xprofile
deploy_file Xresources .Xresources
deploy_file zprofile .zprofile
deploy_file config/mpd/mpd.conf .config/mpd/mpd.conf
deploy_file config/i3/config .config/i3/config
deploy_file config/fontconfig/fonts.conf .config/fontconfig/fonts.conf

deploy_directory ncmpcpp .ncmpcpp
deploy_directory vim/colors .vim/colors
deploy_directory config/ranger .config/ranger
deploy_directory config/rofi .config/rofi
deploy_directory config/twmn .config/twmn
deploy_directory config/zathura .config/zathura
deploy_directory config/mutt .config/mutt

crontab -r
cat ~/.rice/misc/crontab | crontab

remove_file .config/compton.conf

