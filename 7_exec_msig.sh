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
approver=$( jq -r '.approver' "0_CONFIG.json" )
feeExec=$( jq -r '.feeExec' "0_CONFIG.json" )

./clio.sh multisig exec $proposer $proposalName $feeExec -p $approver