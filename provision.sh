sudo apt-get update -y
sudo apt-get upgrade -y

#install java
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -q install oracle-java8-installer
sudo update-java-alternatives -s java-8-oracle

#install elasticsearch
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.6.0.deb
sudo dpkg -i elasticsearch-1.6.0.deb

#configure remote connections and admin plugin for elasticsearch
sudo cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo ./usr/share/elasticsearch/./plugin install royrusso/elasticsearch-HQ
#change path to PID file for elastic
sudo cp /vagrant/elasticsearch /etc/init.d/elasticsearch

#install nodejs v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs

#install nodemon
sudo npm install -g nodemon