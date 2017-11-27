# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Add .local/bin to PATH
export PATH="/home/osman/.local/bin:$PATH"

# Use URxvt as default terminal
export TERMINAL=urxvt256c-ml

# User specific aliases and functions

#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Gtk hack to remove client-side decorations
# export GTK_CSD=0
# export LD_PRELOAD=$HOME/.src/gtk3-nocsd/libgtk3-nocsd.so.0


# aliases
alias bigscreen='gsettings set org.gnome.desktop.interface scaling-factor 2; gsettings set org.gnome.desktop.interface text-scaling-factor 1.25'
alias smallscreen='gsettings set org.gnome.desktop.interface scaling-factor 1; gsettings set org.gnome.desktop.interface text-scaling-factor 1.0'
alias tmux='tmux -2'
alias vim='vimx'
