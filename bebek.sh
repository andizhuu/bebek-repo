#!/data/data/com.termux/files/usr/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="User91-repo GUI"
TITLE="User91-repo GUI"
MENU="Please select:"

OPTIONS=(1 "Install user91-repo"
         2 "Uninstall user91-repo"
         3 "About Me"
         4 "Contact Me")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Installing user91-repo..."
            # Tambahkan perintah instalasi di sini
            ;;
        2)
            echo "Uninstalling user91-repo..."
            # Tambahkan perintah uninstall di sini
            ;;
        3)
            echo "Saya adalah pembuat GUI ini di Termux"
            ;;
        4)
            echo "Hubungi saya di: github.com/user91"
            ;;
esac

