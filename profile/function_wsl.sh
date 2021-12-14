if test -f "/etc/wsl.conf"; then
    refresh_resolvconf() {
        # Get the IP Address (without any carriage return added by running a Windows command)
        NAMESERVER=`/mnt/c/WINDOWS/system32/netsh.exe interface ip show config name="vEthernet (WSL)" \
                    | grep "IP Address" \
                    | cut -d: -f2 \
                    | sed "s/\r//"`
        # Replace the nameserver line - line 6 in my config
        sudo sed -i "s/nameserver\s.*$/nameserver $NAMESERVER/" /etc/resolv.conf
    }
fi
