echo "remove command reboot_new..."
rm -f /usr/sbin/reboot_now /usr/sbin/reboot
ln -s /usr/sbin/shutdown /usr/sbin/reboot
echo "remove command poweroff_now..."
rm -f /usr/sbin/poweroff_now /usr/sbin/poweroff
ln -s /usr/sbin/shutdown /usr/sbin/poweroff
echo "remove auto suspend script..."
rm -f /var/lib/vz/snippets/pve-hibernate-all
