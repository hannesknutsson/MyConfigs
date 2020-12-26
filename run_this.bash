#!/bin/bash

INST=installers
PACK=packages
SUDO_MSG='Running script as super user... You may be prompted for your password.'

if ! command -v whiptail &> /dev/null
then
  #Install whiptail so that we can continue the script
  echo "System is missing the whiptail package. This script uses whiptail to display text based user interfaces."
  echo "Press enter to attempt installing it, or Ctrl+C to stop the script. Installation will be run using sudo."
  read
  echo $SUDO_MSG
  sudo $INST/install_packages.bash $PACK/tui_setup
fi

  

whiptail \
--separate-output \
--title 'Select what scripts to run' \
--ok-button 'Run selected scripts' \
--checklist 'Select what scripts to run' 10 100 4 \
"Install CLI tools" "Tools for command line environments" on \
"Install GUI tools" "Tools for graphical environments" on \
"Install i3 setup" "i3 window manager with dependencies and i3 specific tools" off \
"Link configs" "Create symlinks replacing old configs with configs handled by Git" on \
3>&1 1>&2 2>&3 \
| while read CHOICE
do
  case $CHOICE in
    'Install CLI tools')
      echo 'Installing command line interface tools...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/default_cli_packages
      ;;
    'Install GUI tools')
      echo 'Installing grapgical tools...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/default_gui_packages
      ;;
    'Install i3 setup')
      echo 'Installing i3 and tools for i3...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/i3_packages
      ;;
    'Link configs')
      echo 'Linking configurations to versions handled by Git...'
      ./.symlink_configs.bash
      ;;
    *)
      echo "Nondefined choice '$CHOICE' received. Skipping..."
      ;;
  esac
done

echo haha
