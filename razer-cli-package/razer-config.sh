 
#!/bin/bash

if [[ "$1" == "configure" ]]; then
    if [[ "$(kreadconfig --file razer-cli-kcm.conf --group General --key ToggleState)" == "true" ]]; then
        razer-cli -d "Razer Ornata V2" -e none
        razer-cli -d "Razer Mamba Elite" -e none
    fi
elif [[ "$1" == "remove" ]]; then
    # Cleanup if needed
    :
fi

exit 0
