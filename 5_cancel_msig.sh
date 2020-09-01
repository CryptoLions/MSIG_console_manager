#!/bin/bash
################################################################################
# MSIG Console Manager
#
# Scrip Created by http://CryptoLions.io
# For FIO Blockchain
#
# Check Readme for more info.
#
# https://github.com/CryptoLions/MSIG_console_manager/tree/FIO
#
################################################################################

proposer=$( jq -r '.proposer' "0_CONFIG.json" )
proposalName=$( jq -r '.proposalName' "0_CONFIG.json" )
approver=$( jq -r '.approver' "0_CONFIG.json" )

feeCancel=$( jq -r '.feeCancel' "0_CONFIG.json" )

./clio.sh push action eosio.msig cancel '{"proposer":"'$proposer'", "proposal_name":"'$proposalName'","canceler":"'$proposer'","max_fee":"'$feeCancel'"}' -p $proposer


