
# Create a tmux session window 1 will be a vertical split for text editing
# window 2 will be for git
# Window 3 will be for build

# on load window 1 will run a fetch origin and status check to show the current status


SESSION_NAME="nixos"

# create the session
tmux new-session -d -s $SESSION_NAME
tmux set mouse on

tmux bind k kill-session

tmux rename-window -t $SESSION_NAME:1 'Main'

# Split the session
tmux split-window -h -t $SESSION_NAME:1

# start git status
tmux send-keys -t $SESSION_NAME:1.1 "git fetch origin && git status" C-m


# Open git window
tmux new-window -t $SESSION_NAME -n 'git'
# preload gitpane
tmux send-keys -t $SESSION_NAME:2 'git status'


# Open build window
tmux new-window -t $SESSION_NAME -n 'build'
# preload gitpane
tmux send-keys -t $SESSION_NAME:3 'build'

# Swap back to the first window
tmux select-window -t $SESSION_NAME:1

# Select the first pane
tmux select-pane -t $SESSION_NAME:1.0


tmux attach-session -t $SESSION_NAME
