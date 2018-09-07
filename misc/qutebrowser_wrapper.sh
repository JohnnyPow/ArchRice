#!/bin/sh

cd ~/.local/share/qutebrowser/userscripts
git pull origin master
git reset --hard
git clean -dfxn
chmod +x *
cd ~/.config/qutebrowser
git pull origin master
git reset --hard
git clean -dfxn
case $1 in
  private)
    qutebrowser ":open -p" --nowindow
  ;;
  *)
    qutebrowser
  ;;
esac
git add -A
git commit -a -m "script update"
git push
