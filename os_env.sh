sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential

wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
tar  -xzf go1.16.3.linux-amd64.tar.gz
mv go $HOME/

#.bashrc add Recommende
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/goApps
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/go/bin:$HOME/goApps/bin:

#.bashrc add Recommende
curl https://sh.rustup.rs -sSf | sh
export PATH=$HOME/.cargo/bin:$PATH
rustup default stable
rustup update stable