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

feeCancel=$( jq -r '.feeCancel' "0_CONFIG.json" )

./clio.sh push action eosio.msig cancel '{"proposer":"'$proposer'", "proposal_name":"'$proposalName'","canceler":"'$proposer'","max_fee":"'$feeCancel'"}' -p $proposer


