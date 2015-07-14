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

#install php
sudo apt-get install -y apache2
sudo apt-get install -y php5
sudo apt-get install -y libapache2-mod-php5
sudo /etc/init.d/apache2 restart

#install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org