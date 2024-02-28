#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${UID:-9001}
GROUP_ID=${GID:-9001}
USERNAME=${UNAME:-user}
HOME_PATH=${HOME_DIR:-/home/$USERNAME}

echo "Starting with UID : $USER_ID"

groupadd $USERNAME -g $GROUP_ID
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -d $HOME_PATH -o -c "" $USERNAME
#export HOME=/home
#chown $USER_ID:$GROUP_ID /home

exec gosu $USERNAME "$@"
