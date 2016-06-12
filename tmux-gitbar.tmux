# tmux-gitbar: Git in tmux status bar
#
# Created by Aurélien Rainone
# github.com/aurelien-rainone/tmux-gitbar

# generate tmux-gitbar.conf if it doesn't exist
if-shell 'test -f $HOME/.tmux-gitbar.conf -o -L $HOME/.tmux-gitbar.conf' \
  "if-shell 'test -z ${TMUX_GITBAR_DIR}' \
    'run-shell \"~/.tmux-gitbar/lib/generate-config.sh $HOME/.tmux-gitbar.conf\"'" \
  "if-shell '! test -z ${TMUX_GITBAR_DIR}' \
    'run-shell \"$TMUX_GITBAR_DIR/lib/generate-config.sh $HOME/.tmux-gitbar.conf\"'"

# install update-gitbar as a prompt command if not done already
if-shell 'echo $PROMPT_COMMAND | grep -qv update-gitbar' \
  "if-shell 'test -z \"${TMUX_GITBAR_DIR}\"' \
    'PROMPT_COMMAND=\"~/.tmux-gitbar/update-gitbar; $PROMPT_COMMAND\"' \
    'PROMPT_COMMAND=\"$TMUX_GITBAR_DIR/update-gitbar; $PROMPT_COMMAND\"'"
