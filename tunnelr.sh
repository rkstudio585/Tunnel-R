#!/bin/bash

# Colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
RESET="\033[0m"

# Banner
banner_r(){
echo -e "${CYAN}"
echo "  ______                   __    ___ "
echo " /_  __/_ _____  ___  ___ / /___/ _ \\"
echo "  / / / // / _ \\/ _ \\/ -_) /___/ , _/"
echo " /_/  \\_,_/_//_/_//_/\\__/_/   /_/|_| "
echo "                                      "
echo "     Script By RK From RK Studio     "
echo -e "${RESET}"
}

# Function to check and install prerequisites
check_prerequisites() {
    echo -e "${YELLOW}[+] Checking prerequisites...${RESET}"
    command -v wget >/dev/null 2>&1 || { echo -e "${RED}[-] wget is not installed. Installing it now...${RESET}"; pkg install wget -y; }
    command -v tar >/dev/null 2>&1 || { echo -e "${RED}[-] tar is not installed. Installing it now...${RESET}"; pkg install tar -y; }
    command -v node >/dev/null 2>&1 || { echo -e "${RED}[-] nodejs is not installed. Installing it now...${RESET}"; pkg install nodejs -y; }
    echo -e "${GREEN}[+] Prerequisites are ready!${RESET}"
}

# Function to install ngrok
setup_ngrok() {
    if command -v ngrok >/dev/null 2>&1; then
        echo -e "${GREEN}[+] Ngrok is already installed!${RESET}"
        read -p "Do you want to reinstall ngrok? (y/n): " REINSTALL
        if [[ "$REINSTALL" != "y" ]]; then
            echo -e "${YELLOW}[+] Skipping ngrok setup.${RESET}"
            return
        fi
        rm -f ../usr/bin/ngrok
    fi

    echo -e "${YELLOW}[+] Setting up ngrok...${RESET}"
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz -O ngrok.tgz
    tar -xvzf ngrok.tgz -C ../usr/bin && rm ngrok.tgz
    echo -e "${GREEN}[+] Ngrok installed successfully!${RESET}"
    read -p "Enter your ngrok authtoken: " AUTHTOKEN
    ngrok config add-authtoken $AUTHTOKEN
}

# Function to configure and start ngrok tunnel
start_ngrok_tunnel() {
    echo -e "${YELLOW}[+] Starting ngrok tunnel...${RESET}"
    read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
    read -p "Enter a custom hostname (leave empty for default): " CUSTOM_HOSTNAME

    if [[ -z "$CUSTOM_HOSTNAME" ]]; then
        ngrok http $LOCAL_PORT
    else
        ngrok http $LOCAL_PORT --hostname=$CUSTOM_HOSTNAME
    fi
}

# Function to set up Cloudflared
setup_cloudflared() {
    if command -v cloudflared >/dev/null 2>&1; then
        echo -e "${GREEN}[+] Cloudflared is already installed!${RESET}"
        read -p "Do you want to reinstall Cloudflared? (y/n): " REINSTALL
        if [[ "$REINSTALL" != "y" ]]; then
            echo -e "${YELLOW}[+] Skipping Cloudflared setup.${RESET}"
            return
        fi
        rm -f ../usr/bin/cloudflared
    fi

    echo -e "${YELLOW}[+] Setting up Cloudflared...${RESET}"
    pkg install cloudflared
    echo -e "${GREEN}[+] Cloudflared installed successfully!${RESET}"
}

# Function to configure and start Cloudflared tunnel
start_cloudflared_tunnel() {
    echo -e "${YELLOW}[+] Starting Cloudflared tunnel...${RESET}"
    read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
    cloudflared tunnel --url http://localhost:$LOCAL_PORT
}

# Function to set up Tunnelmole
setup_tunnelmole() {
    echo -e "${YELLOW}[+] Setting up Tunnelmole...${RESET}"
    npm install -g tunnelmole
    echo -e "${GREEN}[+] Tunnelmole installed successfully!${RESET}"
}

# Function to configure and start Tunnelmole
start_tunnelmole_tunnel() {
    echo -e "${YELLOW}[+] Starting Tunnelmole tunnel...${RESET}"
    read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
    tmole $LOCAL_PORT
}

# Function to set up SSH tunneling
start_ssh_tunneling() {
    clear
    banner_r
    echo -e "${BLUE}[+] Starting SSH Tunneling...${RESET}"
    echo -e "${YELLOW}Choose an SSH tunneling service:${RESET}"
    echo "1) Serveo (ssh serveo.net)"
    echo "2) Localhost.run (ssh -R 80:localhost:8080 localhost.run)"
    echo "3) Custom SSH with no key"
    read -p "Select an option (1/2/3): " SSH_OPTION

    case $SSH_OPTION in
    1)
        clear
        banner_r
        echo -e "${YELLOW}[+] Using Serveo...${RESET}"
        read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
        ssh -R 80:localhost:$LOCAL_PORT serveo.net
        ;;
    2)
        clear
        banner_r
        echo -e "${YELLOW}[+] Using Localhost.run...${RESET}"
        read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
        ssh -R 80:localhost:$LOCAL_PORT nokey@localhost.run
        ;;
    3)
        clear
        banner_r
        echo -e "${YELLOW}[+] Using custom SSH without a key...${RESET}"
        read -p "Enter the local port to forward (e.g., 8080): " LOCAL_PORT
        read -p "Enter the remote server address (e.g., user@hostname): " REMOTE_SERVER
        ssh -R 80:localhost:$LOCAL_PORT $REMOTE_SERVER
        ;;
    *)
        echo -e "${RED}[-] Invalid option!${RESET}"
        sleep 2
        clear
        banner_r
        ;;
    esac
}

# Main Menu
while true; do
    clear
    banner_r
    echo -e "${YELLOW}"
    echo "================== MENU =================="
    echo "1) Set up Ngrok"
    echo "2) Start Ngrok Tunnel"
    echo "3) Set up Cloudflared"
    echo "4) Start Cloudflared Tunnel"
    echo "5) Set up Tunnelmole"
    echo "6) Start Tunnelmole Tunnel"
    echo "7) Start SSH Tunneling"
    echo "8) Exit"
    echo "=========================================="
    echo -e "${RESET}"
    read -p "Select an option (1-8): " OPTION

    case $OPTION in
    1)
        clear
        banner_r
        setup_ngrok
        ;;
    2)
        clear
        banner_r
        start_ngrok_tunnel
        ;;
    3)
        clear
        banner_r
        setup_cloudflared
        ;;
    4)
        clear
        banner_r
        start_cloudflared_tunnel
        ;;
    5)
        clear
        banner_r
        setup_tunnelmole
        ;;
    6)
        clear
        banner_r
        start_tunnelmole_tunnel
        ;;
    7)
        clear
        banner_r
        start_ssh_tunneling
        ;;
    8)
        clear
        banner_r
        sleep 2
        clear 
        echo -e "${GREEN}[+] Exiting the tool. Goodbye!${RESET}"
        exit 0
        ;;
    *)
        echo -e "${RED}[-] Invalid option! Please try again.${RESET}"
        sleep 2
        clear
        ;;
    esac
done
