source /etc/nixos/modules/services/todoist/scripts/config.sh

# Morning Walk
echo "{\"project_name\": \"Personal\", \"content\": \"Morning Walk [45m]\", \"due_string\": \"7am\", \"labels\": [\"45mins\", \"cron\", \"excersize\", \"action\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Westpac specific

# Westpac Standup
echo "{\"project_name\": \"Westpac\", \"content\": \"Standup [30m]\", \"due_string\": \"9:30am\", \"labels\": [\"cron\", \"work\", \"meeting\", \"alignment\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Wpac Backup
echo "{\"project_name\": \"Westpac\", \"content\": \"Code has been backed up [5m]\", \"due_string\": \"8:30am\", \"labels\": [\"cron\", \"work\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Push Commits
echo "{\"project_name\": \"Westpac\", \"content\": \"Commits are pushed [15m]\", \"due_string\": \"4:30pm\", \"labels\": [\"cron\", \"work\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null

