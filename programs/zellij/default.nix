{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "onedark";
      pane_frames = false;
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };

}
