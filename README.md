# Tunnel-R 🌐🚀

Welcome to **Tunnel-R**, a robust and efficient bash script developed by **RK from RK Studio**! This tool helps you create secure tunnels for local servers using popular tunneling services like **Ngrok**, **Cloudflared**, **Tunnelmole**, and **SSH tunneling**. Whether you’re a developer needing remote access or a tester running services, **Tunnel-R** makes tunneling seamless and straightforward. 💻✨

---

![Tunnel-R Logo](logo.svg)

---

## Key Features 🛠️

- **Automated Prerequisites Setup**: Installs missing dependencies like `wget`, `tar`, and `nodejs`.
- **Support for Multiple Tunneling Services**:
  - **Ngrok**: HTTP/HTTPS tunneling with custom hostname support.
  - **Cloudflared**: Easy tunnel setup for Cloudflare.
  - **Tunnelmole**: Simple and lightweight tunneling solution.
  - **SSH Tunneling**: Options for Serveo, Localhost.run, or custom SSH tunneling.
- **User-Friendly Menu**: Intuitive and colorful menu-driven interface.
- **Reinstallation Option**: Reinstall Ngrok or Cloudflared if necessary.
- **Secure Custom Hostname**: Set up personalized URLs for your tunnels.

---

## Requirements 📋

- **Operating System**: Termux (Linux-based environment)
- **Dependencies**: `wget`, `tar`, `nodejs`
- **Ngrok Account**: For an authtoken to configure Ngrok tunnels.

---

## Installation 🚀

1. Clone the repository:
   ```bash
   git clone https://github.com/rkstudio585/Tunnel-R.git
   cd Tunnel-R
   ```
2. Make the script executable:
   ```bash
   chmod +x tunnelr.sh
   ```
3. Run the script:
   ```bash
   ./tunnelr.sh
   ```
   Or 
   ```bash
   bash tunnelr.sh
   ```

---

## How to Use 🧑‍💻

### Main Menu
When you run the script, you'll be greeted with a colorful menu:

```
================== MENU ==================
1) Set up Ngrok
2) Start Ngrok Tunnel
3) Set up Cloudflared
4) Start Cloudflared Tunnel
5) Set up Tunnelmole
6) Start Tunnelmole Tunnel
7) Start SSH Tunneling
8) Exit
==========================================
```

### Options Explained

1️⃣ **Set up Ngrok**  
   - Installs or reinstalls Ngrok.  
   - Prompts for your Ngrok authtoken to configure the tunnel.

2️⃣ **Start Ngrok Tunnel**  
   - Forward a local port using Ngrok.  
   - Optionally set up a custom hostname.

3️⃣ **Set up Cloudflared**  
   - Installs or reinstalls Cloudflared.

4️⃣ **Start Cloudflared Tunnel**  
   - Forward a local port using Cloudflared.

5️⃣ **Set up Tunnelmole**  
   - Installs Tunnelmole globally using `npm`.

6️⃣ **Start Tunnelmole Tunnel**  
   - Forward a local port using Tunnelmole.

7️⃣ **Start SSH Tunneling**  
   - Options to use Serveo, Localhost.run, or custom SSH tunneling.

8️⃣ **Exit**  
   - Gracefully exits the script.

---

## Example Usage 📘

### Forwarding a Port with Ngrok
1. Select **1) Set up Ngrok** to install Ngrok.
2. Enter your Ngrok authtoken when prompted.
3. Select **2) Start Ngrok Tunnel**.
4. Enter the local port to forward (e.g., `8080`).
5. Optionally, provide a custom hostname (or press Enter to skip).

### Creating an SSH Tunnel
1. Select **7) Start SSH Tunneling**.
2. Choose a tunneling service:
   - Serveo: `ssh -R 80:localhost:<PORT> serveo.net`
   - Localhost.run: `ssh -R 80:localhost:<PORT> nokey@localhost.run`
   - Custom SSH: Use your preferred remote server.
3. Enter the local port and follow the prompts.

---

## Color-Coded Outputs 🎨

- **Yellow**: Informational messages (e.g., progress updates).  
- **Green**: Success messages.  
- **Red**: Error messages or missing prerequisites.  
- **Blue**: SSH tunneling options and banners.  
- **Cyan**: Stylish banner.

---

## Contributing 🤝

Contributions are welcome! Please open an issue or submit a pull request to help improve **Tunnel-R**.

---

## License 📜

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Made with ❤️ by **RK from RK Studio**. Happy Tunneling! 🌟
