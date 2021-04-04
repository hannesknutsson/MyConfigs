#zsh-specific .profile file

#Only add zsh-specific stuff to here

#Read the generic profile settings if they are available
if [ -f "$HOME/.generic_profile" ] ; then
    . "$HOME/.generic_profile"
fi
