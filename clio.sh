#!/bin/bash
################################################################################
#
# Script Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################



CLIO=$( jq -r '.clio' "0_CONFIG.json" )
WALLETHOST=$( jq -r '.walletHost' "0_CONFIG.json" )
NODEHOST=$( jq -r '.nodeHost' "0_CONFIG.json" )

$CLIO -u $NODEHOST --wallet-url $WALLETHOST "$@"

