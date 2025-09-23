{ lib, pkgs-unstable, ... }:
let
    flatten = (import ../../util.nix lib).flatten;
in
flatten {
    "terminal" = {
        "integrated.defaultProfile.linux" = "fish";
        "integrated.allowedLinkSchemes" = [
            "file"
            "http"
            "https"
            "mailto"
            "vscode"
            "vscode-insiders"
            "docker-desktop"
        ];
    };

    "editor" = {
        "fontFamiliy" = "'JetBrainsMono Nerd Font Mono Light', Consolas, 'Courier New', monospace";
        "fontLigatures" = true;
        "minimap.enabled" = false;
    };

    "explorer" = {
        "confirmDragAndDrop" = false;
        "confirmPasteNative" = false;
    };

    "workbench" = {
        "colorTheme" = "GitHub Dark Dimmed";
        "editor.empty.hint" = "hidden";
        "panel.defaultLocation" = "right";
    };

    "git.openRepositoryInParentFolders" = "never";

    # Vscodium sometimes ignores key rebinding of ESC to CAPS
    "keyboard.dispatch" = "keyCode";


    # Languages and extensions

    "python.terminal.activateEnvironment" = false;

    "[python]" = {
        "editor.defaultFormatter" = "charliermarsh.ruff";
    };
    "[typst-code]" = {
        "editor.wordSeparators" = "`~!@#$%^&*()=+[{]}\\|;:'\",.<>/?";
    };
    "[typst]" = {
        "editor.wordSeparators" = "`~!@#$%^&*()=+[{]}\\|;:'\",.<>/?";
    };
    "glsllint.fallBackStage" = "comp";
    "julia.enableTelemetry" = false;
    "julia.symbolCacheDownload" = true;
    "python.createEnvironment.trigger" = "off";
    "redhat.telemetry.enabled" = false;
    "rust-analyzer.cargo.buildScripts.overrideCommand" = null;
    "rust-analyzer.cargo.features" = "all";
    "tinymist.preview.refresh" = "onSave";
    "tinymist.previewFeature" = "disable";
    "typescript.updateImportsOnFileMove.enabled" = "never";
    "typst-lsp.exportPdf" = "never";
    "vim.useSystemClipboard" = true;
    "rust-analyzer.server.path" = "${pkgs-unstable.rust-analyzer}/bin/rust-analyzer";
}
