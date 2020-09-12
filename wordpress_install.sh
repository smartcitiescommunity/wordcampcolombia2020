#Crea una instancia en aws en un free tier
#Selecciona el sistema operativo Ubuntu 20.04 lts
#Crea un disco duro de proposito general de 26 Gigas como root "/" y otro de 4 Gigas para el Swap
#https://help.ubuntu.com/community/SwapFaq
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
sudo cp -R wordpress /var/www/html/wordcamp2020
ls -l /var/www/html/
sudo chown -R www-data:www-data /var/www/html/wordcamp2020
sudo chmod -R 775 /var/www/html/wordcamp2020
mysqladmin -u root -p create wordcamp2020
mysqladmin -u root -p
#CREATE USER 'wordcamp2020'@'localhost' IDENTIFIED BY 'wordcamp2020';
#GRANT ALL PRIVILEGES ON * . * TO 'wordcamp2020'@'localhost';
#FLUSH PRIVILEGES;
curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v2.3.0/utils/wp-completion.bash
source ~/wp-completion.bash
source ~/.bash_profile
#wget https://github.com/wp-cli/builds/raw/gh-pages/deb/php-wpcli_latest_all.deb
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info
#wp_install () 
#{ 
#    wp core download --path=$1;
#    cd $1;
#    read -p 'nombre de la DB:' dbname;
#    wp config create --dbname=$dbname --dbuser=wordcamp2020 --dbpass=wordcamp2020 --dbhost=localhost;
#    wp db create;
#    wp core install --prompt
#}
#
#source ~/.bashrc
#wp_install nuevo
sudo wp cli update
wp core download --locale=es_ES
wp core config --dbhost=localhost --dbname=wordcamp2020 --dbprefix=wc2020_ --dbuser=wordcamp2020 --dbpass="wordcamp2020"
wp db create
wp core install --url=http://localhost --title="WordCamp 2020" --admin_user=wordcamp2020 --admin_password="wordcamp2020" --admin_email=juan.villa@paisdelconocimiento.org 
 wp search-replace 'http://localhost' 'http://misitio.com' --skip-columns=guid
wp package install anhskohbo/wp-cli-themecheck
wp plugin install jetpack --activate
wp plugin install total-cache --activate
wp plugin install optimize
wp plugin install autoptimize
wp plugin install rocket-lazy-load
wp plugin install wordpress-seo
wp plugin install table-of-contents-plus
wp plugin install wp-smushit
#wp plugin deactivate total-cache
wp theme install twentysixteen --activate
wp theme update twentysixteen
wp theme status twentysixteen
#wp theme disable twentysixteen


