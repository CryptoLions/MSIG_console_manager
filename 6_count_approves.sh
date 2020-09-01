#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOSIO Blockchains
#
# https://github.com/CryptoLions/
#
################################################################################


proposer=$( jq -r '.proposer' "0_CONFIG.json" )
proposalName=$( jq -r '.proposalName' "0_CONFIG.json" )

./clio.sh get table eosio.msig $proposer approvals2 -L $proposalName -l 1 | jq '.rows[0].provided_approvals | length'
