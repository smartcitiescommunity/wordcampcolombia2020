#Crea una instancia en aws en un free tier
#Selecciona el sistema operativo Ubuntu 20.04 lts
#Crea un disco duro de proposito general de 26 Gigas como root "/" y otro de 4 Gigas para el Swap
sudo mkswap /dev/xvdb
sudo swapon /dev/xvdb
#/dev/xvdb swap swap defaults 0 0
#sudo mkdir /media/swap2/
#sudo dd if=/dev/zero of=/swap bs=1024 count=1
#sudo mkswap /swap
#/swap swap swap defaults 0 0
sudo sysctl vm.swappiness=10
#/etc/sysctl.conf
#en la ultima linea poner
#vm.swappiness=10

wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
ls -l
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
sudo cp -R wordpress /var/www/html/wordcamp2020
ls -l /var/www/html/
sudo chown -R www-data:www-data /var/www/html/wordcamp2020
sudo chmod -R 775 /var/www/html/wordcamp2020
mysqladmin -u root -p create wordcamp2020
#CREATE USER 'wordcamp2020'@'localhost' IDENTIFIED BY 'wordcamp2020';
#GRANT ALL PRIVILEGES ON * . * TO 'wordcamp2020'@'localhost';
#FLUSH PRIVILEGES;
