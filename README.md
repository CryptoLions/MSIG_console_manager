# MSIG_console_manager FIO
Bash scripts to create/review/approve/cancel/execute msigs


1. Edit 0_CONFIG.json
- proposer: account name who creates msig
- proposalName: msig name (chars a-z.1-5 allowed only, max length 12 symbols)
- approver value also will be used as executer on msig execute.
- msig_expiration_h: value in hours how long msig will be active

- actions_list_file: list of actions which will be added to msig. One action per row. Do not include -s -j -d parametrs, they will be added automatically.

- requireBPsapprove: if set to 1 - top 30 BPS will be added as approvers automatically, if set to 0 please edit next parametr `approvers_list`
- approvers_list: list of msig approvers. Example `{\"actor\": \"acc1\", \"permission\": \"active\"},{\"actor\": \"acc2\", \"permission\": \"active\"}`

- clio: path to clio binary
- walletHost: your keosd daemon information
- nodeHost: chain api node url

2. Prepare actions list which will be included in msig (in example file 1_actions_list)

3. run scripts 2-7 depend on need