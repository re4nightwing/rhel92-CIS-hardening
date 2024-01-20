#!/bin/bash

# List of scripts to be executed
SCRIPTS=("content_rule_accounts_password_pam_retry.sh" "content_rule_accounts_password_set_max_life_existing.sh" "content_rule_accounts_password_set_min_life_existing.sh" "content_rule_audit_rules_privileged_commands.sh" "content_rule_disable_host_auth.sh" "content_rule_service_nfs_disabled.sh" "content_rule_service_nftables_disabled.sh" "content_rule_service_rpcbind_disabled.sh" "content_rule_sshd_set_keepalive.sh" "generate_grub2_password.sh" )

# Loop through each script
for SCRIPT in "${SCRIPTS[@]}"; do
    echo "Running $SCRIPT with sudo..."
    sudo ./$SCRIPT
    echo "$SCRIPT completed."
done