source /etc/nixos/modules/services/todoist/scripts/config.sh

# Bins
echo "{\"project_name\": \"House\", \"content\": \"Bins have been taken out [15m]\", \"due_string\": \"Friday 7am\", \"labels\": [\"cron\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null

# Clean Toilets
echo "{\"project_name\": \"House\", \"content\": \"Clean Toilet Downstairs [15m]\", \"due_string\": \"Friday 12pm\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"House\", \"content\": \"Toilet Downstairs is bleached [5m]\", \"due_string\": \"Friday 8am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null
  
echo "{\"project_name\": \"House\", \"content\": \"Clean Toilet Upstairs [15m]\", \"due_string\": \"Friday 12pm\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"House\", \"content\": \"Toilet Upstairs is bleached [5m]\", \"due_string\": \"Friday 7:50am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 3}" | tee $DESTINATION/$(uuid).txt > /dev/null



# Vac
echo "{\"project_name\": \"House\", \"content\": \"Vacuum has been started [20m]\", \"due_string\": \"Monday 8am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"House\", \"content\": \"Vacuum has been started [20m]\", \"due_string\": \"Wednesday 8am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"House\", \"content\": \"Vacuum has been started [20m]\", \"due_string\": \"Friday 8am\", \"labels\": [\"cron\", \"cleaning\", \"action\"], \"priority\": 2}" | tee $DESTINATION/$(uuid).txt > /dev/null


# Todoist Review
echo "{\"project_name\": \"Personal\", \"content\": \"ToDoIst Review [20m]\", \"due_string\": \"Monday 8:15am\", \"labels\": [\"cron\", \"gtd\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"Personal\", \"content\": \"ToDoIst Review [20m]\", \"due_string\": \"Wednesday 8:15am\", \"labels\": [\"cron\", \"gtd\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null

echo "{\"project_name\": \"Personal\", \"content\": \"ToDoIst Review [20m]\", \"due_string\": \"Friday 8:15am\", \"labels\": [\"cron\", \"gtd\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null


# Timesheets
echo "{\"project_name\": \"Work\", \"content\": \"Timesheets have been submitted [15m]\", \"due_string\": \"Friday 9am\", \"labels\": [\"cron\", \"work\", \"action\"], \"priority\": 1}" | tee $DESTINATION/$(uuid).txt > /dev/null

