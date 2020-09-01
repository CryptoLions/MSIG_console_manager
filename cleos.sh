#!/bin/bash
################################################################################
#
# Script Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################


$( jq -r '.' "0_CONFIG.json" )

CLEOS=$( jq -r '.cleos' "0_CONFIG.json" )
WALLETHOST=$( jq -r '.walletHost' "0_CONFIG.json" )
NODEHOST=$( jq -r '.nodeHost' "0_CONFIG.json" )

$CLEOS -u $NODEHOST --wallet-url $WALLETHOST "$@"

