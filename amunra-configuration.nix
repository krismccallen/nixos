#
# Amunra Custom Install for NixOS
{ config, lib, pkgs, ... }:

{
	nixpkgs.config.permittedInsecurePackages = [
		"openssl-1.1.1w"
	];


	environment.systemPackages = with pkgs; [
		wget
		curl
		clinfo

		sublime4
		vscode
		go
		rustc
		powershell
		nodejs_20
		python3Full
		python310Packages.pip
		git
		neofetch
		htop
		docker-client
		docker
		tor

		# Security / Networking
		nmap
		rustscan
		thc-hydra
		hydra-cli
		aircrack-ng
		theharvester
		metasploit
		wireshark
		tshark
		ettercap
		bettercap
		dirb
		john
		reaverwps-t6x
		reaverwps
		hashcat
		hashcat-utils
		hcxtools
		wpscan
		sqlmap
		netcat
		netcat-gnu
		nikto
		sherlock
		wifite2
		tcpdump
		gobuster
		burpsuite
		ffuf
		whatweb
		commix
		macchanger
		airgeddon
		kismet
		dnsrecon
		ghidra-bin
		ghidra
		fcrackzip
		crackmapexec
		cryptsetup
		amass
		subfinder
		binwalk
		yara
		yaralyzer
		apktool
		dex2jar
		evil-winrm
		medusa
		vault-medusa


		cudaPackages.cudnn
		cudaPackages.nvidia_fs
		cudaPackages.nvidia_driver
		nvidia-docker


	];

	virtualisation.docker.enable = true; 

	nixpkgs.config.allowBroken = true;

# Configuring Nvidia PRIME
  hardware.nvidia.nvidiaSettings = true;
  services.xserver.videoDrivers = ["nouveau"];
  hardware.opengl.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
   offload.enable = true;

   # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
   nvidiaBusId = "PCI:01:00.0";

   # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
   intelBusId = "PCI:00:02.0";
  };
  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia.powerManagement.enable = true;

}