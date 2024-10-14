# How it works #
add an auto_suspend script before real poweroff and reboot working

## Installation ##

```bash
curl https://raw.githubusercontent.com/leejohannes/PVE_auto_suspend/refs/heads/main/install_pve_auto_suspend.sh -o install_pve_auto_suspend.sh
bash install_pve_auto_suspend.sh && rm install_pve_auto_suspend.sh
```

## Uninstallation ##

```bash
curl https://raw.githubusercontent.com/leejohannes/PVE_auto_suspend/refs/heads/main/uninstall_pve_auto_suspend.sh -o uninstall_pve_auto_suspend.sh
bash uninstall_pve_auto_suspend.sh && rm uninstall_pve_auto_suspend.sh
```

if you coincidently del or rm poweroff, you may ln it back from systemctl...same file function when linked as different name

```bash
ln -s /usr/bin/systemctl /usr/sbin/shutdown
```
