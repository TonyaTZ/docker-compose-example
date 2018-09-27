cd ./liquibase
mkdir data
cd data
wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks-oltp-install-script.zip -O ./AWBackup.zip
unzip AWBackup.zip
rm AWBackup.zip
rm instawdb.sql
cd ../
bash import.sh
sudo docker build --tag changelog-image .
cd ../
