#!/usr/bin/env bash

# Detect connected monitors
MONITORS=$(hyprctl monitors all | grep "desc")

if echo "$MONITORS" | grep -q "BNQ GW2780"; then
    echo "Applying Office layout..."

    hyprctl keyword workspace 1,monitor:desc:BNQ GW2780 J9H0001301Q,default:true
    hyprctl keyword workspace 2,monitor:desc:BNQ GW2780 J9H0001301Q
    hyprctl keyword workspace 3,monitor:desc:BNQ GW2780 J9H0001301Q
    hyprctl keyword workspace 4,monitor:desc:BNQ GW2780 J9H0001301Q
    hyprctl keyword workspace 5,monitor:desc:BNQ GW2780 J9H0001301Q
    hyprctl keyword workspace 6,monitor:desc:Dell Inc. DELL P2723DE 8S0B714,default:true
    hyprctl keyword workspace 7,monitor:desc:Dell Inc. DELL P2723DE 8S0B714
    hyprctl keyword workspace 8,monitor:desc:Dell Inc. DELL P2723DE 8S0B714
    hyprctl keyword workspace 9,monitor:desc:Dell Inc. DELL P2723DE 8S0B714
    hyprctl keyword workspace 10,monitor:desc:Dell Inc. DELL P2723DE 8S0B714

else
    echo "Applying Home layout..."

    hyprctl keyword workspace 1,monitor:desc:HP Inc. HP X27i CNK0270K6T,default:true
    hyprctl keyword workspace 2,monitor:desc:HP Inc. HP X27i CNK0270K6T
    hyprctl keyword workspace 3,monitor:desc:HP Inc. HP X27i CNK0270K6T
    hyprctl keyword workspace 4,monitor:desc:HP Inc. HP X27i CNK0270K6T
    hyprctl keyword workspace 5,monitor:desc:HP Inc. HP X27i CNK0270K6T
    hyprctl keyword workspace 6,monitor:desc:AOC 24G2W1G4 0x000002D4,default:true
    hyprctl keyword workspace 7,monitor:desc:AOC 24G2W1G4 0x000002D4
    hyprctl keyword workspace 8,monitor:desc:AOC 24G2W1G4 0x000002D4
    hyprctl keyword workspace 9,monitor:desc:AOC 24G2W1G4 0x000002D4
    hyprctl keyword workspace 10,monitor:desc:AOC 24G2W1G4 0x000002D4
fi
