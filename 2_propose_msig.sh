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
EXPIRATION_IN_H=$( jq -r '.msig_expiration_h' "0_CONFIG.json" )
actions_list_file=$( jq -r '.actions_list_file' "0_CONFIG.json" )
requireBPsapprove=$( jq -r '.requireBPsapprove' "0_CONFIG.json" )
approvers_list=$( jq -r '.approvers_list' "0_CONFIG.json" )

feePropose=$( jq -r '.feePropose' "0_CONFIG.json" )
feeApprove=$( jq -r '.feeApprove' "0_CONFIG.json" )
feeCancel=$( jq -r '.feeCancel' "0_CONFIG.json" )
feeExec=$( jq -r '.feeExec' "0_CONFIG.json" )

if [[ $requireBPsapprove -eq 1 ]]; then
    APPROVERS=$(./clio.sh system listproducers -j -l 30 | jq -r '.producers[] | ( "{\"actor\": \"" + .owner + "\", \"permission\": \"active\"}" )' | paste -s -d",")
else
    APPROVERS=$approvers_list
fi

expire_date="$(date -d "+$EXPIRATION_IN_H hour" +%Y-%m-%dT%H:%M:%S)"

## Any trx just to create TRX Body
TRX_BODY=$(./clio.sh push action eosio init '[1,"4,EOS"]' -p eosio -s -d -j 2>/dev/null)
TRX_BODY=$(echo $TRX_BODY | jq -c '.expiration=$expire | del(.actions[])' --arg expire "$expire_date")

echo $TRX_BODY > trx.json

while read actions; do
    act_res=$(eval $actions -j -s -d  2>/dev/null)
    echo $act_res > acts.json
    tAct=$(cat acts.json | jq '.actions' | jq .)
    echo $tAct > input.json
    R=$(jq  '.actions+=input' trx.json input.json )
    echo $R | jq . > trx.json
    rm ./acts.json
    rm ./input.json
done < $actions_list_file

./clio.sh multisig propose_trx $proposalName "[$APPROVERS]" $feePropose trx.json $proposer -p $proposer

#rm trx.json

