#!/bin/bash
ip="$1"
until [ "$ip" != "" ]
do
  read -p "Please input Server IP: " ip
done
cd ~
cat > noauth.sh << EOF
#!/bin/bash
cd ~
mkdir .ssh; chmod 700 .ssh
cat _temp.pub > .ssh/authorized_keys
chmod 644 .ssh/authorized_keys
rm -f _temp.pub
rm -f noauth.sh
cd -
EOF
chmod +x noauth.sh
cp .ssh/id_rsa.pub _temp.pub
scp noauth.sh _temp.pub "$ip":~/
ssh "$ip"
cd -

