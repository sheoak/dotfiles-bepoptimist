#!/bin/bash

declare -a devices=(XHC)
for device in "${devices[@]}"; do
    if grep -qw ^$device.*enabled /proc/acpi/wakeup; then
        sh -c "echo $device > /proc/acpi/wakeup"
    fi
done

