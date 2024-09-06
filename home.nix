{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "flo";
  home.homeDirectory = "/home/flo";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    helix
    neovim
    jetbrains.idea-community
    git
    gh
    jetbrains-mono
    nerdfonts
    fish
    alacritty
    awesome
    neovim
    docker
    unzip
    gnome.dconf-editor
    btop

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/helix" = {
      source = ./helix;
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hart_fo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };


  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.35408;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      tap-and-drag-lock = true;
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
    };
    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "JetBrains Mono 10";
    };
    "org/gnome/desktop/applications/terminal" = {
      exec = "${pkgs.alacritty}/bin/alacritty";
    };
  };

  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "florian.hartung@dlr.de";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable fish as shell
  programs.fish.enable = true;
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    shell = "${pkgs.fish}/bin/fish";
    window.opacity = 0.85;
    font.normal = { family = "Jetbrains Mono"; };
  };


  xsession.enable = true;
  xsession.windowManager.awesome.enable = true;
}

