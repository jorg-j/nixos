source /etc/nixos/modules/services/todoist/scripts/config.sh

# Humble Bundle
echo "{\"project_name\": \"Personal\", \"content\": \"Humble Bundle Check Website [15m]\", \"due_string\": \"Saturday 10am\", \"labels\": [\"cron\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Optus
echo "{\"project_name\": \"Personal\", \"content\": \"Optus Bill is paid [15m]\", \"due_string\": \"9th 7pm\", \"labels\": [\"cron\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Dishwasher Clean
echo "{\"project_name\": \"House\", \"content\": \"Clean Dishwasher [15m]\", \"due_string\": \"Tomorrow 5pm\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Clean Washing Machine
echo "{\"project_name\": \"House\", \"content\": \"Clean Washing Machine [15m]\", \"due_string\": \"Saturday 7pm\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

#  Dust Windows and Plants
echo "{\"project_name\": \"House\", \"content\": \"Dust Windows and Plants [15m]\", \"due_string\": \"Saturday 9am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Clean Aircon Filters
echo "{\"project_name\": \"House\", \"content\": \"Aircon Filters checked and cleaned [30m]\", \"due_string\": \"Sunday 11:00am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null