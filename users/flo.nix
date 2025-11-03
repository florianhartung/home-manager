{ pkgs, ... }:
{
  home.username = "flo";
  home.homeDirectory = "/home/flo";
  home.stateVersion = "25.05"; # shouldn't be changed ever
  
  nixpkgs.config.allowUnfree = true;

  # programs.kitty.enable = true;

  # home.keyboard = {
  #   layout = "us";
  #   variant = "altgr-intl";
  #   options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
  # };

  imports = [
    ./common.nix
    ../modules/home
  ];

  home.shellAliases = {
    cdg = "cd ~/git";
    cdm = "cd ~/git/florianhartung";
    hswitch = "home-manager switch";
  };

  modules = {
    alacritty.enable = true;
    discord.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    gde-stuff = {
      enable = true;
      mouse-speed = 0.58;
    };
    vscodium.enable = true;
    zed.enable = true;
  };

  xdg.enable = true;
  xdg.desktopEntries = {
    looking-glass-fix = {
      type = "Application";
      name = "Looking Glass (fix)";
      exec = "__NV_DISABLE_EXPLICIT_SYNC=1 looking-glass-client";
      terminal = false;
      categories = ["System"];

      # SingleMainWindow = true;
      # Icon="looking-glass";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  programs.gpg = {
    enable = true;
  };

  home.packages = with pkgs; [
    vlc
    yubioath-flutter

    ## development
    broot
    nixd

    ## virtualization
    docker
    wasmedge

    ## utils
    unzip
    btop
    xclip
    nix-search-cli

    ## music
    spotify

    ## gaming
    steam

    # mail
    # thunderbird
    tutanota-desktop
    # protonmail-bridge-gui


    goxel
    atlauncher
    worldpainter

    quickemu

    keepassxc

    jabref
    obsidian
    element-desktop
    pinentry
    rust-analyzer
  
    openconnect

    ## network analysis
    # wireshark
    # ettercap

    # element-desktop
    # mattermost
    # citrix_workspace #?
    # thefuck #?
    # openssl #?

    (pkgs.writeShellScriptBin "todo" ''
      ${pkgs.helix}/bin/hx ~/docs/todo.md
    '')
  ];
}

