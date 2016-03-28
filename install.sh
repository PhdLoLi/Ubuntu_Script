#add user
sudo adduser lijing
sudo adduser lijing sudo
#install config file 
sudo cp sources.list /etc/apt/
cp .vimrc ../
cp -r .vim ../
cp .tmux.conf ../
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openssh-server
ssh-keygen -t rsa
cp authorized_keys ../.ssh 

#change hostname & ip
#hostname two files
sudo cat 222.92.116.123 sznode1 >> /etc/hosts 
sudo cat 222.92.116.122 sznode0 >> /etc/hosts 
sudo cat 222.92.116.116 sznode >> /etc/hosts 
sudo cat 222.92.116.115 sz >> /etc/hosts 

sudo apt-get install exuberant-ctags
sudo apt-get install tmux
sudo apt-get install htop
sudo apt-get install unzip
# install every thing for purepaxos 
sudo apt-get install clang
sudo apt-get install pkg-config
sudo apt-get install libboost-all-dev
sudo apt-get install libprotobuf-dev protobuf-compiler python-protobuf
sudo apt-get install libzmq3-dev python-zmq

#install for nfd & ndn-cxx
sudo apt-get install libyaml-cpp-dev python-yaml
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:named-data/ppa
sudo apt-get update
sudo apt-get install nfd
sudo apt-get install git
sudo apt-get install build-essential
sudo apt-get install libsqlite3-dev libcrypto++-dev

#install ufw
sudo apt-get install ufw
sudo ufw allow ssh
sudo ufw allow from 222.92.116.122
sudo ufw allow from 222.92.116.122
sudo ufw enable

#harden ssh login
#- PermitRootLogin no
#- PasswordAuthentication no
sudo service ssh restart
