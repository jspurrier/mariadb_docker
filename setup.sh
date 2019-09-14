chown -R mysql:mysql /var/lib/mysql/
sleep 3
ls -lah /var/lib/mysql
/usr/bin/mysqld_safe > /dev/null 2>&1 < /dev/null &
sleep 1
ls -lah /var/lib/mysql
/usr/bin/mysqladmin -u root password '<Your Password>'
