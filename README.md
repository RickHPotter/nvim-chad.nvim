# nvim-chad

Reference:
> https://youtu.be/Mtgo-nP_r8Y
> https://youtu.be/i04sSQjd-qo
> https://youtu.be/mh_EJhH49Ms

I'll proceed with only cmd lines (This is for linux only, by the way)
Just my two cents here. If you have to use Windows, then either go for Linux Virtual
Machine (this runs fine on Windows) or go for a WSL config. I use both.

## Installing Nvim 0.9

Disclaimer: This set of instructions work as long as you don't have another vim installed
and have both rust and go installed already. As for go, make sure you GOPATH is corret.

```bash
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo apt-get install xz-utils
tar -xf nvim-linux64.tar.gz
mv nvim-linux64 nvim
cp -r nvim $HOME
cd
sublime .bashrc (could use nano, but it sucks)
# append to file the following lines without '#':
# alias vim=nvim
# export PATH=$HOME/nvim/bin:$PATH
# save file, if in nano, you have to summon a demon to save it for you
source .bashrc
nvim -v
# if it's not 0.9 or more, then none of the following steps will work
```

## Installing NvimChad

Disclaimer: Make sure you have gcc or g++ or ming64w installed. You need either C or C++
for nvim-treesitter to work. Might be a pain, but make sure it works. Always use the tag
--reinstall when installing these, maybe you do have them, but they're corrupted or some
shit (that was my case).

```bash
sudo apt-get install --reinstall -y build-essential
sudo apt-get install --reinstall -y git
gcc --version
# if last line outputs something other than dread, hooray!
# if you have a nvim setup with some shit you don't want to lose, back that up with
# mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
# Press N when nvim asks you to use setupt on its own and wait for nvim to set default
```

## Cloning repo into config folder

Considerations:

- As for GO, again, make sure your GOPATH is set accordingly, and now install the the
following go packages: gofumpt, goimports-reviser and golines. For these to work, you
have to install them using `go instal ...` and be able to call them, e.g. `golines`,
if this last command prompts `golines is not a command`, then your GOPATH is messed up.

```bash
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

- As for Rust, again, make sure you installed Rust. You will need it for the next command.

```bash
rustup component add rust-analyzer
sudo apt-get update
sudo apt-get install lldb
```

If you're not me, which is a pleasant way to live ('inside in i feel like i dont belong here')
go for this step below.
```bash
mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom.backup 
cd ~/Downloads
git clone <this_repo>
cp -r <this_repo>/custom/* ~/.config/nvim/lua/custom
nvim
# last command might prompt another install window, just wait
```
Otherwise, if you're me and I'm you, then go for this next step.
```bash
cd ~/.config/nvim/lua
rm -rf custom.backup
mv custom custom.backup
git clone <this_repo>
nvim
```

```bash
Then inside nvim, a prompt will popup for new install, wait. A second time,
you might have to run the following command.
```vim
:MasonInstallAll
// wait and see, dont get confused, theres an 'All' at the end.
```

## Customising and Mapping

-- TODO: Fill this up!

SPACE t h -> set theme, cat

## Language Support

Inside nvim, press colon (:) and write `:TSInstall <>` being <> the name of the language.
In this case, go or rust, whichever. To see which ones are there, you can call for :TSInstallInfo.
You can write down all the languages you want syntax-highlight on and use them as args, like:
:TSInstall a b c d

