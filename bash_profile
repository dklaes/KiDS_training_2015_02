if [ "$SSH_CONNECTION" != "" ] && [ "$HOSTNAME" != "gate1" ]; then
   /usr/bin/screen -ls
   read -p "Session name: " name
   /usr/bin/screen -S "${name}" -d -R -t "${name}"
fi

CHECKBASH=1

. .bashrc
