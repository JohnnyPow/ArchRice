# My Arch Linux rice
This is and will always be WIP.  
The default configuration files are made for a hidpi setup with some system specific settings.  
There are however multiple patches available (e.g. for 1080p compatibility).

### default system specific settings include (not limited to)
- hidpi
- eu keyboard layout
- single screen connected on eDP1

### Instructions
1. Backup your existing config files. They will be overwritten!
2. `git clone https://github.com/JohnnyVim/arch-rice.git`
3. Read the files before syncing!
4. `./arch-rice/scripts/sync.sh`
5. apply necessary patches (e.g. for 1080p `./arch-rice/scripts/patch_1080p.sh`)
6. adjust settings specific to your system
7. install the packages you want/need
8. Tip: You can create your own patch files to make future updating much easier.

### Packages used (incomplete)
- core
- extra
- community
  - compton
- AUR
  - enpass-bin
  - imwheel
  - lightdm-slick-greeter
  - packer
  - polybar
  - unclutter-xfixes-git

### Roadmap
- [x] add scripts for automated updating
- [ ] remove some system specific settings and make patches "cleaner"
- [ ] complete package list

### Credits
stole some ideas and code from [Luke Smith's Rice](https://github.com/LukeSmithxyz/voidrice)  
VM start script heavily inspired by [John Koelndorfer's version](https://github.com/jkoelndorfer/local-tools/blob/master/workstation/vfio/qemu-win10)  
  
other resources:  
[Arch Wiki](https://wiki.archlinux.org/)  
[i3 User’s Guide](https://i3wm.org/docs/userguide.html)  
