#!/bin/bash
################################################################################
# MSIG Console Manager
#
# Scrip Created by http://CryptoLions.io
# For EOSIO Blockchains
#
# Check Readme for more info.
#
# https://github.com/CryptoLions/MSIG_console_manager
#
################################################################################

proposer=$( jq -r '.proposer' "0_CONFIG.json" )
proposalName=$( jq -r '.proposalName' "0_CONFIG.json" )
approver=$( jq -r '.approver' "0_CONFIG.json" )

./cleos.sh multisig exec $proposer $proposalName -p $approver