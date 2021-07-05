sudo apt-get -y update
sleep 2s
sudo apt-get -y upgrade
sleep 2s
sudo apt-get -y install build-essential jq

wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
tar  -xzf go1.16.3.linux-amd64.tar.gz
rm -r $HOME/go 
mv go $HOME/
rm go1.16.3.linux-amd64.tar.gz


#.bashrc add Recommende
echo "export PATH=$PATH:$HOME/go/bin" >> $HOME/.bashrc
echo "export GOPATH=$HOME/goApps" >> $HOME/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >> $HOME/.bashrc
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/go/bin:$HOME/goApps/bin:" >> $HOME/.bashrc
source ~/.bashrc


#.bashrc add Recommende
curl https://sh.rustup.rs -sSf | sh
echo "case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac" >> $HOME/.bashrc
source ~/.bashrc


rustup default stable
rustup update stable
