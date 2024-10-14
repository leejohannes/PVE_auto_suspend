echo "move command reboot to reboot_new..."
rm -f /usr/sbin/reboot_now
ln -s /usr/sbin/shutdown /usr/sbin/reboot_now
echo "move command poweroff to poweroff_now..."
rm -f /usr/sbin/poweroff_now
ln -s /usr/sbin/shutdown /usr/sbin/poweroff_now
echo "add auto suspend script..."
mkdir /var/lib/vz/snippets/
cat > /var/lib/vz/snippets/pve-hibernate-all <<EOF
qm list | grep running | awk -F '[^0-9]*' '\$0=\$2' | while read -r vm_id; do qm suspend \$vm_id --todisk 1; done;
while qm list | grep running>/dev/null; do sleep 1; done;
EOF
echo "add poweroff command with auto suspend..."
cat > /usr/sbin/poweroff <<EOF
/var/lib/vz/snippets/pve-hibernate-all
/usr/sbin/poweroff_now
EOF
echo "add reboot command with auto suspend..."
cat > /usr/sbin/reboot <<EOF
/var/lib/vz/snippets/pve-hibernate-all
/usr/sbin/reboot_now
EOF
echo "add authorization to script..."
chmod 777 /usr/sbin/reboot  /usr/sbin/poweroff /var/lib/vz/snippets/pve-hibernate-all
