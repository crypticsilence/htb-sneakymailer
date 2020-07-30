#!/bin/bash

echo
echo "Massmailer2"
echo "==========="
if [[ -z "$6" ]]; then
  echo "Usage: "
  usage=' <smtp ip> <port> <email_list.txt> <from_email@htb.local> <message> <file>'
  echo " $0 $usage "; echo; echo
  exit
fi
cat $3 | while read line; do
  sendemail -s $1 -o tls=no -f $4 -t $line -m $5 -a $6
  echo "[+] Sent email to $line ..."
done

