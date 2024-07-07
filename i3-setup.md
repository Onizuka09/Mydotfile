## Installation:
### **Method 1**: install Using `apt`
 
```bash 
sudo add-apt-repository  ppa:simon-monette/i3-gaps
sudo apt update 
sudo apt install i3-gaps
# if the add-apt operation failed, remove the ppa and flow the steps mentioned in the Method2 
sudo add-apt-repository --remove ppa:simon-monette/i3-gaps
```
### **Method 2**: Build from source 
#### Installing requirements  
```bash 
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libxcb-xrm-dev libxcb-shape0-dev  libtool automake
sudo apt install meson asciidoc
```
#### Compiling and building   
```bash
# you may also need other requirement 
sudo apt install i3 
# remove it 
sudo apt purge i3 
# building from source 
mkdir tmp/build 
cd tmp/build
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
meson -Ddocs=true -Dmans=true ../build
meson compile -C ../build
sudo meson install -C ../build
```
#### Cleaning    
```bash
# you can delete the hole tmp/ directory 
sudo rm -r tmp 
# if you don't need meson and asciidoc you can remove them too 
sudo apt purge meson and asciidoc 
```
## Additional application needed with i3
```bash 
# copy the i3 config file to .config/
cp -r i3 .config/
# in the i3 config line 263 change the path of the walpaper 
/home/${whoami}/${path_to_wall_paper}
# also in line 77 change teh path of the picom.conf 
/home/${whoami}/.config/picom/picom.config 
# install applicatoins related to i3
sudo apt install xorg i3-wm feh  i3lock i3status i3blocks 
# install an apllication manager 
sudo apt install rofi
# install pulse audio for audio configuration 
sudo apt install pulseaudio 
# install picom to control transperancy 
sudo apt install picom
# copy the picom configuration to .config 
cp -r picom .config/ 
# for a terminal application i am using kitty 
sudo apt install kitty 
# To dipsplay the picture, i am using feh 
sudo apt install feh 
```
> **Note:**
> Feel free to install or add you favorite apps 
## References: 

[This what i used as reference to configure i3](https://www.youtube.com/watch?v=j1I63wGcvU4&list=PL0rXAycsylvXxyPDT5kGQ5MiHcqrZWv69)
[i3-gaps apt installation guide](https://github.com/Airblader/i3/wiki/Installation)
[i3-gaps apt installation guide YouTube](https://www.youtube.com/watch?v=6MYCU8uaU2w)
[i3-gaps build from source resource](https://askubuntu.com/questions/1415720/ubuntu-22-04-jammy-jellyfish-cannot-install-i3-gaps)