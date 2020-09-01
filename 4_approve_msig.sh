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
feeApprove=$( jq -r '.feeApprove' "0_CONFIG.json" )

./clio.sh multisig approve $proposer $proposalName '{"actor": "'$approver'", "permission": "active"}' $feeApprove -p $approver



