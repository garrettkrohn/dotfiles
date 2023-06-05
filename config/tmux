#| .--------------. || .--------------. || .--------------. || .--------------. |
#| |  _________   | || | ____    ____ | || | _____  _____ | || |  ____  ____  | |
#| | |  _   _  |  | || ||_   \  /   _|| || ||_   _||_   _|| || | |_  _||_  _| | |
#| | |_/ | | \_|  | || |  |   \/   |  | || |  | |    | |  | || |   \ \  / /   | |
#| |     | |      | || |  | |\  /| |  | || |  | '    ' |  | || |    > `' <    | |
#| |    _| |_     | || | _| |_\/_| |_ | || |   \ `--' /   | || |  _/ /'`\ \_  | |
#| |   |_____|    | || ||_____||_____|| || |    `.__.'    | || | |____||____| | |
#| |              | || |              | || |              | || |              | |
#| '--------------' || '--------------' || '--------------' || '--------------' |
# '----------------'  '----------------'  '----------------'  '----------------' 

set -g default-terminal "screen-256color"

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

bind -r m resize-pane -Z

set -g mouse on

set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

# tpm plugin
set -g @plugin 'tmux-plugins/tpm'

# list of tmux plugins
set -g @plugin 'christoomey/vim-tmux-navigator' # for navigating panes and vim/nvim with Ctrl-hjkl
set -g @plugin 'jimeh/tmux-themepack' # to configure tmux theme
set -g @plugin 'tmux-plugins/tmux-resurrect' # persist tmux sessions after computer restart
set -g @plugin 'tmux-plugins/tmux-continuum' # automatically saves sessions for you every 15 minutes
# set -g @themepack 'powerline/default/cyan' # use this theme for tmux
set -g @resurrect-capture-pane-contents 'on' # allow tmux-ressurect to capture pane contents
set -g @continuum-restore 'on' # enable tmux-continuum functionality

### List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-yank'
# set -g @plugin "janoamaral/tokyo-night-tmux"
# set -g @plugin 'dracula/tmux'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# set -g @dracula-show-powerline true 
# set -g @dracula-fixed-location "Minneapolis"
# set -g @dracula-plugins "time weather"
# set -g @dracula-show-flags true
# set -g @dracula-show-left-icon session
# set -g @dracula-border-contrast false
# set -g @dracula-show-timezone false
# set -g @dracula-military-time false 

set -g @plugin 'joshmedeski/t-smart-tmux-session-manager'

# smart tmux session manager settings
bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt
set -g detach-on-destroy off  # don't exit from tmux when closing a session

######################
### DESIGN CHANGES ###
######################

# # loud or quiet?
# set -g visual-activity off
# set -g visual-bell off
# set -g visual-silence off
# setw -g monitor-activity off
# set -g bell-action none
#
# # modes
# setw -g clock-mode-colour colour5
# setw -g mode-style 'fg=colour1 bg=colour18'
#
# # panes
# set -g pane-border-style 'fg=colour19 bg=colour0'
# set -g pane-active-border-style 'bg=colour1 fg=colour9'
#
# #statusbar
# set -g status-position top 
# set -g status-justify left
# set -g status-style 'bg=colour18 fg=colour138 dim'
# set -g status-left ''
# set -g status-right '#[fg=colour233,bg=colour19] %d/%m #[fg=colour233,bg=colour8] %H:%M:%S '
# set -g status-right-length 0
# set -g status-left-length 20
#
# setw -g window-status-current-style 'fg=colour1 bg=colour19 bold'
# setw -g window-status-current-format ' #I#[fg=colour249]:#[fg=colour255]#W#[fg=colour249]#F '
#
# setw -g window-status-style 'fg=colour9 bg=colour18'
# setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
#
# setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'
#
# #messages
# set -g message-style 'fg=colour232 bg=colour16 bold' 
#
# # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)








run '~/.tmux/plugins/tpm/tpm'
