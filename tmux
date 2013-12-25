set-option -g prefix C-a
unbind-key C-b

set -g default-terminal screen-256color

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"

# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

# scrollback buffer limit?
set -g history-limit 10240

# Bad Wolf
set -g status-fg white
set -g status-bg colour234
set -g window-status-activity-attr bold
set -g pane-border-fg colour245
set -g pane-active-border-fg colour39
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold

# Custom status bar
# Pretty powerline-status bar
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour238,nobold]#[fg=colour15,bg=colour238,bold] #(ls ~/.mail/steve-stevelosh.com/INBOX/cur  ~/.mail/steve-stevelosh.com/INBOX/new | wc -l | tr -d " ") #[fg=colour238,bg=colour234,nobold]'

set -g status-right '#[fg=colour245] %R  %d %b #[fg=colour254,bg=colour234,nobold]#(rdio-current-track-tmux)#[fg=colour16,bg=colour254,bold] #h '

set -g window-status-format "#[fg=white,bg=colour234] #I #W "
set -g window-status-current-format "#[fg=colour234,bg=colour39]#[fg=colour16,bg=colour39,noreverse,bold] #I  #W #[fg=colour39,bg=colour234,nobold]"

# Saner splitting.
bind v split-window -h
bind s split-window -v
bind S choose-session

# Pane movement
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
