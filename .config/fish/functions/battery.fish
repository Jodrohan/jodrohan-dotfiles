function battery
    set HW_FILE "/sys/devices/pci0000:00/0000:00:14.3/PNP0C09:00/VPC2004:00/conservation_mode"
    set CONF_FILE "/etc/tmpfiles.d/lenovo-conservation.conf"

    if test "$argv[1]" = "60"
        echo 1 | sudo tee "$HW_FILE" > /dev/null
        echo "w $HW_FILE - - - - 1" | sudo tee "$CONF_FILE" > /dev/null
        sudo systemd-tmpfiles --create "$CONF_FILE"
        echo "✅ Battery permanently limited to 60%"
    else if test "$argv[1]" = "100"
        echo 0 | sudo tee "$HW_FILE" > /dev/null
        sudo rm -f "$CONF_FILE"
        echo "🔋 Battery will now charge to 100%"
    else
        echo "How to use this command:"
        echo "Type 'battery 60' to limit charge and protect battery."
        echo "Type 'battery 100' to fully charge for travel."
    end
end
