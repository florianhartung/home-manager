{ pkgs, lib, firefox-addons, ... }@inputs:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      bookmarks = import ./bookmarks.nix;
      settings = import ./settings.nix inputs;
      extensions = import ./extensions.nix { inherit firefox-addons pkgs; };
      search = {
        engines = import ./search-engines.nix;
        force = true;

        default = "Google";
        privateDefault = "DuckDuckGo";
      };
      userContent = ''
        @-moz-document url("about:home"), url("about:newtab") {
          body {
            background-image: url("https://wallpapers.com/images/hd/cozy-anime-1920-x-1080-vit526qd39q6oh4z.jpg") !important;
            background-repeat: no-repeat !important;
            background-position: center !important;
            background-size: cover !important;
            background-attachment: fixed !important; 
            background-color: rgba(255, 230, 200, 0.35) !important;
            background-blend-mode: multiply !important;
          }
          main {
            justify-content: start;
          }
        }        
      '';
    };
  };
}
