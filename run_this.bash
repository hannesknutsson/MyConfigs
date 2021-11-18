#!/bin/bash

INST=scripts
PACK=packages
SUDO_MSG='Running script as super user... You may be prompted for your password.'
LOG_DIR=logs
mkdir $LOG_DIR 2> /dev/null

case $1 in
  'cli')
    SELECTION=$(echo -e "Install CLI tools\nLink configs")
  ;;
  'gui')
    SELECTION=$(echo -e "Install GUI tools\nLink configs")
  ;;
  *)
    if ! command -v whiptail &> /dev/null
    then
      #Install whiptail so that we can continue the script
      echo "System is missing the whiptail package. This script uses whiptail to display text based user interfaces."
      echo "Press enter to attempt installing it, or Ctrl+C to stop the script. Installation will be run using sudo."
      read
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/tui_setup
    fi

    SELECTION=$(whiptail \
    --separate-output \
    --title 'Select what scripts to run' \
    --ok-button 'Run selected scripts' \
    --checklist 'Select what scripts to run' 10 100 4 \
    "Install CLI tools" "Tools for command line environments" off \
    "Install GUI tools" "Tools for graphical environments" off \
    "Install i3 setup" "i3 window manager with dependencies and i3 specific tools" off \
    "Link configs" "Create symlinks replacing old configs with configs handled by Git" off \
    3>&1 1>&2 2>&3)
  ;;
esac

echo "$SELECTION" | while read CHOICE
do
  case $CHOICE in
    'Install CLI tools')
      echo 'Installing command line interface tools from package list...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/default_cli_packages
      echo 'Installing ZSH...'
      echo ''
      $INST/install_oh-my-zsh.bash >> $LOG_DIR/oh-my-zsh.log 2>&1 
      sudo chsh -s `which zsh` $USER
      echo 'Installing latest version of k8s tools...'
      $INST/install_k8s_tools.bash
      echo ''
      echo 'Installing vim plugins...'
      echo ''
      curl -s -o "$HOME/.vim/autoload/plug.vim" --create-dirs -LO "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
      vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall
      ;;
    'Install GUI tools')
      echo 'Installing graphical tools from repositories...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/default_gui_packages
      echo -e 'Installing graphical tools from AppImages...\n'
      $INST/install_appimages.bash
      ;;
    'Install i3 setup')
      echo 'Installing i3 and tools for i3...'
      echo $SUDO_MSG
      sudo $INST/install_packages.bash $PACK/i3_packages
      sudo $INST/install_i3_tools.bash
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

