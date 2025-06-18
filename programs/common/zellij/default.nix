{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "onedark";
      pane_frames = false;
      default_shell = "fish";
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };

}
