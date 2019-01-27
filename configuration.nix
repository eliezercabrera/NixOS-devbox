# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  programs.mosh.enable = true;
  networking.hostId = "12345678";

  users.users.eli = {
    isNormalUser = true;
    home = "/home/eli";
    description = "Eli Productions";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa 
AAAAB3NzaC1yc2EAAAADAQABAAABAQCqJgJvtX9xeYg2OoSgB0VKrKCTx1ziYgOTM5GiZnIta/QxqXpRYDlMtNFBSOJYZEYGCc8bhkxRO1iSuDrS6tlakAhjV8sQuHHlKAAlydFEOtKEbDkuWhMbujvuUcu3eQBQqpGdtYtOZEa9fuLha/x8+TMZg+2XmgAZvgGU1fOXFg9vatIgJS5ICrjVBc6IlLxpVWF1QwVRhrZLozUxXowdvM2q39SR5MhEkF9ld3njxf2hoRtiGrG8fCj52hP6TfO1g8H0zT6QrslCJmm7pKiV4NDuRC+tM05VHKcVr2X/aZVM1f6ShVvhvyXzHJSWqjNQnHlOJKKdmaEE4IB7Xc8Z
 eli@nix" ];
};

  # Settings recommended on Linode's guide to set up NixOS.
  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  networking.usePredictableInterfaceNames = false;
  environment.systemPackages = with pkgs; [
    # Diagnostic tools recommended on Linode's guide.
    inetutils
    mtr
    sysstat

    tmux

    micro
    kakoune
    neovim
    vim
    emacs25-nox

    mosh
    git
    stow
    
    openjdk
    maven
    gradle

    gcc
    clang

    python

    bazel

    haskellPackages.ghc
    haskellPackages.ghcid
    haskellPackages.hindent

    texlive.combined.scheme-full
  ];


  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
